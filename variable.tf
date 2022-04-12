variable "resource_group_name" {
  default = "ajith_RG"
  type    = string
}

variable "resource_group_location" {
  default = "eastus"
  type    = string
}

variable "project" {
  default = "aim"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "zone" {
  default = "hub"
  type    = string
}

variable "address_space" {
  description = "vlan address_space"
  type        = list(string)
  default     = ["10.100.0.0/16"]
}

variable "vlan_name" {
  default = "vlan"
  type    = string
}

variable "subnet_name" {
  default = "subnet"
  type    = string
}

variable "subnet_address_space" {
  description = "subnet address space"
  type        = list(string)
  default     = ["10.100.1.0/24"]
}

variable "public_ip_name" {
  default = "publicip"
  type    = string
}

variable "nic_name" {
  default = "nic"
  type    = string
}

variable "winvm_name" {
  description = "name for windows server"
  type        = string
  default     = "wintest"
}

variable "vm_size" {
  description = "vm size"
  type        = string
  default     = "Standard_F2"
}

variable "admin_username" {
  description = "windows admin user name"
  type        = string
  default     = "aimadmin"
}


variable "admin_password" {
  description = "windows admin password"
  type        = string
  default     = "Aim@12345"
}

variable "source_image_sku" {
  description = "windows image version"
  type        = string
  default     = "2016-Datacenter"
}

variable "source_image_version" {
  description = "windows image version"
  type        = string
  default     = "latest"
}















