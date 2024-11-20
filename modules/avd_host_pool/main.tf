resource "azurerm_virtual_desktop_host_pool" "hostpool" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Pooled"
  load_balancer_type  = "BreadthFirst"
  friendly_name       = var.friendly_name
}
