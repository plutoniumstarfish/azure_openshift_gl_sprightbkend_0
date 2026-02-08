locals {
  loc_name = replace(lower(var.location), " ", "")
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-bastion-pip"
  location            = data.azurerm_resource_group.shared_rg.location
  resource_group_name = data.azurerm_resource_group.shared_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = "${var.org}-${var.infra_env}-${local.loc_name}-bastion-host"
  resource_group_name = data.azurerm_resource_group.shared_rg.name
  location            = data.azurerm_resource_group.shared_rg.location

  ip_configuration {
    name                 = "configuration"
    subnet_id               = data.azurerm_subnet.bastion_subnet.id
    public_ip_address_id    = azurerm_public_ip.bastion_pip.id
  }
}
