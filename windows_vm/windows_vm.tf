resource "azurerm_windows_virtual_machine" "example" {
    name                  = "${var.winvm_name}-vm"
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin
  admin_password      = var.password
  network_interface_ids = var.network_interface_id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.source_image_sku
    version   = var.source_image_version
  }
}


