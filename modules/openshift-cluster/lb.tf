resource "azurerm_lb" "internal_api" {
  name                = "${local.resource_name_default}-internal-lb"
  location            = var.location
  resource_group_name = local.rg_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "frontend"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip_address
  }
}
