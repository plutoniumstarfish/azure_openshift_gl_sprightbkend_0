
resource "azurerm_network_interface" "agent" {
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
