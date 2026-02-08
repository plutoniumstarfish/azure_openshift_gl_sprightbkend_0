resource "azurerm_network_security_group" "cluster_nsg" {
  name                = "${var.cluster_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Allow SSH from Bastion subnet only
resource "azurerm_network_security_rule" "ssh_from_bastion" {
  name                        = "Allow-SSH-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = var.vnet_cidr
  destination_port_range      = "22"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.cluster_nsg.name
}

# Allow internal VNet communication
resource "azurerm_network_security_rule" "internal_vnet" {
  name                        = "Allow-VNet"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_address_prefix       = var.vnet_cidr
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.cluster_nsg.name
}
