locals {
  loc_name = replace(lower(var.location), " ", "")
}

resource "azurerm_resource_group" "shared_rg" {
  name     = "${var.org}-${var.infra_env}-${local.loc_name}-shared-rg"
  location = var.location
}

resource "azurerm_network_security_group" "shared_nsg" {
  nname               = "${var.org}-${var.infra_env}-${local.loc_name}-shared-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.shared_rg.name
}

resource "azurerm_virtual_network" "sharednet_vnet" {
  count               = length(var.address_space)
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-shared-vnet"
  address_space       = element(var.address_space, count.index)
  location            = var.location
  resource_group_name = azurerm_resource_group.shared_rg.name

  tags = {
    environment = var.infra_env
    name        = "${var.org}-${var.infra_env}-${local.loc_name}-shared-vnet"
    group       = "${var.org}-applications"
  }
}

resource "azurerm_subnet" "sharednet_subnet" {
  for_each = var.subnets
  name                 = each.key
  address_prefixes     = [each.value.address_prefix]
  resource_group_name  = azurerm_resource_group.shared_rg.name
  virtual_network_name = azurerm_virtual_network.shared_vnet.name
}
