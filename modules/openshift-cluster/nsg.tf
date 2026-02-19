resource "azurerm_network_security_group" "cluster_nsg" {
  name                = "${local.resource_name_default}-nsg"
  location            = var.location
  resource_group_name = local.rg_name
}

# Allow SSH from Bastion subnet only
resource "azurerm_network_security_rule" "ssh_from_bastion" {
  name                        = "Allow-SSH-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = data.azurerm_virtual_network.shared_vnet.address_space
  destination_port_range      = "22"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.rg_name
  network_security_group_name = azurerm_network_security_group.cluster_nsg.name
}

# Allow internal only same subnet or cluster communication
resource "azurerm_network_security_rule" "allow_same_subnet" {
  name                        = "Allow-Same-Subnet"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_address_prefix       = data.azurerm_subnet.subnet.address_prefix
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = local.rg_name
  network_security_group_name = azurerm_network_security_group.cluster_nsg.name
}