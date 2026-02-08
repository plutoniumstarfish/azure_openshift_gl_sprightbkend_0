 data "azurerm_resource_group" "example" {
  name = "existing"
}

output "id" {
  value = data.azurerm_resource_group.example.id
}