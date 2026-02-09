locals {
  loc_name = replace(lower(var.location), " ", "")
}

resource "azurerm_resource_group" "cluster_rg" {
  name     = local.rg_name
  location = var.location
}

resource "azurerm_network_interface" "bootstrap" {
  name                = "${var.cluster_name}-bootstrap-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.cluster_rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "bootstrap" {
  name                  = "${var.cluster_name}-bootstrap"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.bootstrap_size
  network_interface_ids = [azurerm_network_interface.bootstrap.id]

  admin_username                 = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9-lvm-gen2"
    version   = "latest"
  }
}


resource "azurerm_network_interface" "master" {
  count               = var.master_count
  name                = "${var.cluster_name}-master-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_linux_virtual_machine" "master" {
  count               = var.master_count
  name                = "${var.cluster_name}-master-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.master_size
  network_interface_ids = [azurerm_network_interface.master[count.index].id]
  zone = var.zones[count.index % length(var.zones)]

  admin_username                 = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 120
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9-lvm-gen2"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "worker" {
  count               = var.worker_count
  name                = "${var.cluster_name}-worker-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "worker" {
  count               = var.worker_count
  name                = "${var.cluster_name}-worker-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.worker_size
  network_interface_ids = [azurerm_network_interface.worker[count.index].id]
  zone = var.zones[count.index % length(var.zones)]

  admin_username                 = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 120
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9-lvm-gen2"
    version   = "latest"
  }
}
