org          = "gni"
infra_env    = "dev"
stage        = "1"
location     = "East US"
cluster_name = "nadare"
master_count = 3
worker_count = 20
address_space = ["10.160.0.0/16"]

subnets = {
  gni-dev1-eastus-shared-subnet = {
    address_prefix = "10.160.0.0/20"
  }
  gni-dev2-eastus-shared-subnet = {
    address_prefix = "10.160.16.0/20"
  }
  gni-dev3-eastus-shared-subnet = {
    address_prefix = "10.160.32.0/20"
  }
  gni-dev4-eastus-shared-subnet = {
    address_prefix = "10.160.64.0/20"
  }
  AzureBastionSubnet = {
    address_prefix = "10.160.128.0/26"
  }
  AzureAnsibleAgent = {
    address_prefix = "10.160.148.0/26"
  }
}

admin_username = "azureuser"
ssh_public_key = ""

source_image = {
  publisher = "RedHat"
  offer     = "RHEL"
  sku       = "9-lvm-gen2"
  version   = "latest"
}

os_disk {
  caching              = "ReadWrite"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = 120
}

private_ip_address = "10.160.0.10"

master_size  = var.master_size

zones = ["1","2","3"]
master_size = "Standard_D8s_v5"

worker_size = "Standard_D8s_v5"