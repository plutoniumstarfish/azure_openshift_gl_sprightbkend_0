resource "azurerm_lb" "internal_api" {
  name                = "${var.cluster_name}-internal-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "frontend"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.160.0.10"
  }
}
