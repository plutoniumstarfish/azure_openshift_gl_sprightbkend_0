
data "azurerm_resource_group" "shared_rg" {
  name = "${var.org}-${var.infra_env}-${local.loc_name}-shared-rg"
}

data "azurerm_virtual_network" "shared_vnet" {
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-shared-vnet"
  resource_group_name = data.azurerm_resource_group.shared_rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = local.subnet_name
  virtual_network_name = data.azurerm_virtual_network.shared_vnet.name
  resource_group_name  = data.azurerm_resource_group.shared_rg.name
}
