location = "East US"

address_space = ["10.160.0.0/16"]

subnets = {
  gni-dev-eastus-sharednet-subnet1 = {
    address_prefix = "10.160.0.0/20"
  }
  gni-dev-eastus-sharednet-subnet2 = {
    address_prefix = "10.160.16.0/20"
  }
  AzureBastionSubnet = {
    address_prefix = "10.120.8.0/26"
  }
}
