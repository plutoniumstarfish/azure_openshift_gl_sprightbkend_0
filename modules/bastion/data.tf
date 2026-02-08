
data "azurerm_resource_group" "shared_rg" {
  name = "shared-rg"
}

resource "azurerm_bastion_host" "example" {
  name                = "my-bastion"
  resource_group_name = data.azurerm_resource_group.shared_rg.name
  location            = data.azurerm_resource_group.shared_rg.location
  #