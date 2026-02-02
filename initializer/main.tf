locals {
  loc_name = replace(lower(var.location), " ", "")
}

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate_rg" {
  name     = "${var.org}-${var.infra_env}-${local.loc_name}-tfstate-rg"
  location = var.location
}


resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "${var.org}-${var.infra_env}-${local.loc_name}-tfstate${random_string}"
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = var.infra_env
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}