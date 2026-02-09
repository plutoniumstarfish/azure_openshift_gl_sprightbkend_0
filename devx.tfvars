location = "East US"

infra_env = "dev"
env_suffix = "1"

address_space = ["10.160.0.0/16"]

subnets = {
  gni-dev-eastus-sharednet-subnet-dev1 = {
    address_prefix = "10.160.0.0/20"
  }
  gni-dev-eastus-sharednet-subnet-dev2 = {
    address_prefix = "10.160.16.0/20"
  }
  gni-dev-eastus-sharednet-subnet-dev3 = {
    address_prefix = "10.160.32.0/20"
  }
  gni-dev-eastus-sharednet-subnet-dev4 = {
    address_prefix = "10.160.64.0/20"
  }
  AzureBastionSubnet = {
    address_prefix = "10.160.128.0/26"
  }
  AzureAnsibleAgent = {
    address_prefix = "10.160.148.0/26"
  }
}
