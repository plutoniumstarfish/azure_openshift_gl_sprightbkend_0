address_space = ["10.160.0.0/16"]

subnets = {
  subnet1 = { 
    address_prefix = "10.160.0.0/20"
  }
  subnet2 = {
    address_prefix = "10.160.16.0/20"
  }
  AzureBastionSubnet = {
    address_prefix = "10.160.32.0/26"
  }
}