locals {
  loc_name = replace(lower(var.location), " ", "")
}

resource "azurerm_resource_group" "bastion_rg" {
  name     = "${var.org}-${var.infra_env}-${local.loc_name}-bastion-rg"
  location = var.location
}

resource "azurerm_virtual_network" "bastion_vnet" {
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-bastion-vnet"
  address_space       = ["10.120.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.bastion_rg.name
  virtual_network_name = azurerm_virtual_network.bastion_vnet.name
  address_prefixes     = ["10.120.8.0/26"]
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-bastion-pip"
  location            = azurerm_resource_group.bastion_rg.location
  resource_group_name = azurerm_resource_group.bastion_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-bastion-host"
  location            = azurerm_resource_group.bastion_rg.location
  resource_group_name = azurerm_resource_group.bastion_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}
