variable "subnet_name" {
    description = "subnet name"
    type = string
}

variable "resource_group_name" {
    description = "Resource group name"
    type = string
}

variable "resource_group_location" {
    description = "Resource group Location"
    type = string
}

variable "vlan_name" {
    description = "vlan name"
    type = string
}

variable "subnet_address_space" {
    description = "subnet address space"
    type = list(string)
}



