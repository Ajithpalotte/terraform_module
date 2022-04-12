variable "resource_group_name" {
    description = "Resource group name"
    type = string
}

variable "resource_group_location" {
    description = "Resource group Location"
    type = string
}

variable "winvm_name" {
    description = "name for windows server"
    type = string
}

variable "network_interface_id" {
    description = "NIC ID for Vm"
    type = list(string)
}

variable "vm_size" {
    description = "vm size"
    type = string
}

variable "admin" {
    description = "admin user name"
    type = string
}

variable "password" {
    description = "admin password"
    type = string
}


variable "source_image_sku" {
    description = "windows image version"
    type = string
}

variable "source_image_version" {
    description = "windows image version"
    type = string
}









