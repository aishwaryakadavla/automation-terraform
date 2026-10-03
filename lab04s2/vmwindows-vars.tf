variable "windows_avs" {
  default = "n10023601-w-avs"
}

variable "windows_name" {
  default = {
    "n10023601-w-vm1" = "Standard_D2as_v4"
    "n10023601-w-vm2" = "Standard_D2a_v4"
  }
}

variable "windows_admin_username" {
  default = "10023601"
}

variable "windows_public_key" {
  default = "/home/n10023601/.ssh/id_rsa.pub"
}

variable "windows_os_disk_storage_account_type" {
  default = "StandardSSD_LRS"
}

variable "windows_os_disk_size" {
  default = "128"
}

variable "windows_os_disk_caching" {
  default = "ReadWrite"
}

variable "windows_os_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_os_offer" {
  default = "WindowsServer"
}

variable "windows_os_sku" {
  default = "2016-datacenter-gensecond"

}

variable "windows_os_version" {
  default = "latest"
}

variable "windows_admin_password" {
  type      = string
  sensitive = true
}
