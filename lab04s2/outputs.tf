output "vm_hostname" {
  value = azurerm_linux_virtual_machine.linux-vm[*].computer_name
}

output "vm_fqdn" {
  value = azurerm_public_ip.linux-pip[*].fqdn
}

output "private_ip" {
  value = azurerm_network_interface.linux-nic[*].private_ip_address
}

output "public_ip" {
  value = azurerm_public_ip.linux-pip[*].ip_address
}

output "linux_availability_set" {
  value = azurerm_availability_set.linux-avs.name
}

output "vnet_name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.network-vnet.address_space
}

output "subnet1_name" {
  value = azurerm_subnet.network-subnet1.name
}

output "subnet1_address_space" {
  value = azurerm_subnet.network-subnet1.address_prefixes
}

output "subnet2_name" {
  value = azurerm_subnet.network-subnet2.name
}

output "subnet2_address_space" {
  value = azurerm_subnet.network-subnet2.address_prefixes
}

output "windows_vm_hostname" {
  value = [
    for vm in azurerm_windows_virtual_machine.windows-vm : vm.computer_name
  ]
}

output "windows_vm_fqdn" {
  value = [
    for pip in azurerm_public_ip.windows-pip : pip.fqdn
  ]
}

output "windows_private_ip" {
  value = [
    for nic in azurerm_network_interface.windows-nic : nic.private_ip_address
  ]
}

output "windows_public_ip" {
  value = [
    for pip in azurerm_public_ip.windows-pip : pip.ip_address
  ]
}

output "windows_availability_set" {
  value = azurerm_availability_set.windows-avs.name
}
