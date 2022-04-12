output "nic_name_out" {
  value = azurerm_network_interface.nic.name
}

output "network_interface_id_out" {
  value = [azurerm_network_interface.nic.id]
}