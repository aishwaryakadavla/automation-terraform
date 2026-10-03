resource "azurerm_public_ip" "linux-pip" {
  name                = "${var.linux_name}-pip"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
  allocation_method   = "Static"
  domain_name_label   = var.linux_name
}

resource "azurerm_network_interface" "linux-nic" {
  name                = "${var.linux_name}-nic"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig"
    subnet_id                     = azurerm_subnet.network-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux-pip.id
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = var.linux_name
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
  size                = var.linux_size
  admin_username      = var.linux_admin_username

  network_interface_ids = [
    azurerm_network_interface.linux-nic.id
  ]

  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = file(var.linux_public_key)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk"
    caching              = var.linux_os_disk_caching
    storage_account_type = var.linux_os_disk_storage_account_type
    disk_size_gb         = var.linux_os_disk_size
  }

  source_image_reference {
    publisher = var.linux_os_publisher
    offer     = var.linux_os_offer
    sku       = var.linux_os_sku
    version   = var.linux_os_version
  }
}
