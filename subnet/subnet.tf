
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vlan_name
  address_prefixes     = var.subnet_address_space

}
