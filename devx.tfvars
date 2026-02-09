org          = "gni"
infra_env    = "dev"
stage        = "1"
location     = "East US"
cluster_name = "nadare"

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