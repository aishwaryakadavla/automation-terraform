locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n10023601@humber.ca"
    Environment  = "Lab"
  }
}

variable "linux_name" {
  default = "n10023601-u-vm1"
}

variable "linux_size" {
  default = "Standard_F1ads_v7"
}

variable "linux_admin_username" {
  default = "10023601"
}

variable "linux_public_key" {
  default = "/home/n10023601/.ssh/id_rsa.pub"
}

variable "linux_os_disk_storage_account_type" {
  default = "Premium_LRS"
}

variable "linux_os_disk_size" {
  default = "32"
}

variable "linux_os_disk_caching" {
  default = "ReadWrite"
}

variable "linux_os_publisher" {
  default = "Canonical"
}

variable "linux_os_offer" {
  default = "0001-com-ubuntu-server-jammy"
}

variable "linux_os_sku" {
  default = "22_04-lts-gen2"
}

variable "linux_os_version" {
  default = "latest"
}

variable "linux_avs" {
  default = "n10023601-u-avs"
}

variable "nb_count" {
  default = 2
}
