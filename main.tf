provider "azurerm" {
  features {}
  subscription_id = "3051bfff-c5de-4eef-9d1f-6e5c56d313c4" # Substitua pelo seu subscription_id
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = "RG-TERRAFORM"
  location = "westeurope"
}

module "network" {
  source              = "./modules/network"
  vnet_name           = "avd-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnet_name         = "avd-subnet"
  subnet_prefixes     = ["10.0.1.0/24"]
}

module "avd_host_pool" {
  source              = "./modules/avd_host_pool"
  name                = "avd-hostpool"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  friendly_name       = "AVD Host Pool"
}

module "avd_workspace" {
  source              = "./modules/avd_workspace"
  name                = "avd-workspace"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  friendly_name       = "AVD Workspace"
}

module "windows_vm" {
  source              = "./modules/windows_vm"
  name_prefix         = "win11"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  vm_count            = 3
  vm_size             = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "AdminPassword123"
  subnet_id           = module.network.subnet_id
}
