resource "azurerm_availability_set" "linux-avs" {
  name                         = var.linux_avs
  location                     = azurerm_resource_group.network-rg.location
  resource_group_name          = azurerm_resource_group.network-rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  tags = local.common_tags
}

resource "azurerm_public_ip" "linux-pip" {
  count = var.nb_count

  name                = "${var.linux_name}-${count.index + 1}-pip"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
  allocation_method   = "Static"
  domain_name_label   = "${var.linux_name}-${count.index + 1}"

  tags = local.common_tags

  lifecycle {
  }
}

resource "azurerm_network_interface" "linux-nic" {
  count = var.nb_count

  name                = "${var.linux_name}-${count.index + 1}-nic"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  ip_configuration {
    name                          = "${var.linux_name}-${count.index + 1}-ipconfig"
    subnet_id                     = azurerm_subnet.network-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux-pip[count.index].id
  }

  tags = local.common_tags

  lifecycle {
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  count = var.nb_count

  name                = "${var.linux_name}-${count.index + 1}"
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
  size                = var.linux_size
  admin_username      = var.linux_admin_username
  computer_name       = "${var.linux_name}-${count.index + 1}"

  availability_set_id = azurerm_availability_set.linux-avs.id

  network_interface_ids = [
    azurerm_network_interface.linux-nic[count.index].id
  ]

  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = file(var.linux_public_key)
  }

  os_disk {
    name                 = "${var.linux_name}-${count.index + 1}-os-disk"
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

  tags = local.common_tags
}
