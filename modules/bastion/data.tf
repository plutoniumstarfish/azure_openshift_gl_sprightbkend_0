locals {
  loc_name = replace(lower(var.location), " ", "")
}


data "azurerm_resource_group" "shared_rg" {
  name = "${var.org}-${var.infra_env}-${local.loc_name}-shared-rg"
}


# 2. Look up the Virtual Network created in Module 1
data "azurerm_virtual_network" "shared_vnet" {
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-shared-vnet"
}

# 3. Look up the specific Bastion Subnet
data "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = data.azurerm_virtual_network.shared_vnet.name
  resource_group_name  = data.azurerm_resource_group.shared_rg.name
}
