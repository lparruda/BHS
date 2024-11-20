resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.name_prefix}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  count                 = var.vm_count
  name                  = "${var.name_prefix}-vm-${count.index}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [element(azurerm_network_interface.nic[*].id, count.index)]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-11"
    sku       = "win11-21h2-ent"
    version   = "latest"
  }

  # Garantir que a VM seja destruída antes da interface de rede
  lifecycle {
    prevent_destroy = false
  }

  depends_on = [azurerm_network_interface.nic]
}
