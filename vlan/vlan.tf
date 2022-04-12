resource "azurerm_virtual_network" "vlan" {

  name                = var.vlan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  #tags                = local.hub_tags
}