#-------------------------------------------#
# Local variable configuration
#-------------------------------------------#
locals {
  environment = var.environment
  project     = var.project
  zone        = var.zone

  hub_resource_group_name = "${local.project}-${local.environment}-${local.zone}-${var.resource_group_name}"
  subnet_name             = "${local.project}-${local.environment}-${local.zone}-${var.subnet_name}"
  vlan_name               = "${local.project}-${local.environment}-${local.zone}-${var.vlan_name}"
  public_ip_name          = "${local.project}-${local.environment}-${local.zone}-${var.public_ip_name}"
  tags = {
    environment = local.environment
    zone        = local.zone
    project     = local.project
  }

}

#-------------------------------------------#
# Resource group creation
#-------------------------------------------#

module "resource_group" {
  source                  = "../Modules/resourcegroup"
  resource_group_name     = local.hub_resource_group_name
  resource_group_location = var.resource_group_location
}

#-------------------------------------------#
# Vlan creation
#-------------------------------------------#

module "vlan" {
  depends_on              = [module.resource_group]
  source                  = "../Modules/vlan"
  vlan_name               = local.vlan_name
  resource_group_name     = module.resource_group.rg_name_out
  resource_group_location = var.resource_group_location
  address_space           = var.address_space
}

#-------------------------------------------#
# Subnet creation
#-------------------------------------------#
module "subnet" {
  depends_on              = [module.vlan]
  source                  = "../Modules/subnet"
  subnet_name             = local.subnet_name
  resource_group_name     = local.hub_resource_group_name
  vlan_name               = module.vlan.vlan_name_out
  subnet_address_space    = var.subnet_address_space
  resource_group_location = var.resource_group_location
}

#-------------------------------------------#
# public IP creation
#-------------------------------------------#

module "public_ip" {
  source                  = "../Modules/public_ip"
  public_ip_name          = local.public_ip_name
  resource_group_name     = module.resource_group.rg_name_out
  resource_group_location = var.resource_group_location
}

#-------------------------------------------#
# network interface card creation
#-------------------------------------------#

module "nic" {
  source                  = "../Modules/network_card"
  nic_name                = var.nic_name
  resource_group_location = var.resource_group_location
  resource_group_name     = module.resource_group.rg_name_out
  subnet_id               = module.subnet.subnet_id_out
  public_ip_id            = module.public_ip.public_ip_id_out

}


#-------------------------------------------#
# Creating Windows Virtual Machine
#-------------------------------------------#

module "win_vm" {
  source                  = "../Modules/windows_vm"
  winvm_name              = var.winvm_name
  resource_group_location = var.resource_group_location
  resource_group_name     = module.resource_group.rg_name_out
  vm_size                 = var.vm_size
  admin                   = var.admin_username
  password                = var.admin_password
  network_interface_id    = module.nic.network_interface_id_out
  source_image_sku        = var.source_image_sku
  source_image_version    = var.source_image_version

}


 