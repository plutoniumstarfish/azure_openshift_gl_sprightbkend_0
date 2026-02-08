locals {
  loc_name = replace(lower(var.location), " ", "")
}


data "azurerm_resource_group" "shared_rg" {
  name = "shared-rg"
}


# 2. Look up the Virtual Network created in Module 1
data "azurerm_virtual_network" "shared_vnet" {
  name                = "your-existing-vnet-name"
  resource_group_name = data.azurerm_resource_group.main.name
}

# 3. Look up the specific Bastion Subnet
data "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = data.azurerm_virtual_network.main.name
  resource_group_name  = data.azurerm_resource_group.main.name
}
