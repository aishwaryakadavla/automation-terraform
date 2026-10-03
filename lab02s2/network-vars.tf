variable "resource_group_name" {
  default = "network-rg"
}

variable "location" {
  default = "Canadacentral"
}

variable "virtual_network_name" {
  default = "network-vnet"
}

variable "virtual_network_address_space" {
  default = "10.0.0.0/16"
}

variable "subnet_name_1" {
  default = "network-subnet1"
}

variable "subnet_name_2" {
  default = "network-subnet2"
}

variable "subnet_address_space_1" {
  default = "10.0.0.0/24"
}

variable "subnet_address_space_2" {
  default = "10.0.1.0/24"
}

variable "network_security_group_1" {
  default = "network-nsg1"
}

variable "network_security_group_2" {
  default = "network-nsg2"
}
