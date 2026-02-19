resource "azurerm_public_ip" "nat_pip" {
  name                = "${local.resource_name_default}-nat-pip"
  location            = var.location
  resource_group_name = local.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "nat" {
  name                = "${local.resource_name_default}-nat"
  location            = var.location
  resource_group_name = local.rg_name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_assoc" {
  nat_gateway_id       = azurerm_nat_gateway.nat.id
  public_ip_address_id = azurerm_public_ip.nat_pip.id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_nat" {
  subnet_id      = data.azurerm_subnet.subnet.id
  nat_gateway_id = azurerm_nat_gateway.nat.id
}
