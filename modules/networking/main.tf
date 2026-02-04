locals {
  loc_name = replace(lower(var.location), " ", "")
}

resource "azurerm_resource_group" "sharednet_rg" {
  name     = "${var.org}-${var.infra_env}-${local.loc_name}-sharednet-rg"
  location = var.location
}

resource "azurerm_virtual_network" "sharednet_vnet" {
  count               = length(var.address_space)
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-sharednet-vnet"
  address_space       = element(var.address_space, count.index)
  location            = var.location
  resource_group_name = azurerm_resource_group.sharednet_rg.name

  tags = {
    environment = var.infra_env
    name        = "${var.org}-${var.infra_env}-${local.loc_name}-sharednet-vnet"
    group       = "${var.org}-applications"
  }
}