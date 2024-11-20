resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  friendly_name       = var.friendly_name
}
