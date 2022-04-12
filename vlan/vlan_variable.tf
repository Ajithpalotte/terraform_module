variable "vlan_name" {
    description = "vlan name"
    type = string
}

variable "address_space" {
    description = "vlan address_space"
    type = list(string)
}

variable "resource_group_name" {
    description = "Resource group name"
    type = string
}

variable "resource_group_location" {
    description = "Resource group Location"
    type = string
}


