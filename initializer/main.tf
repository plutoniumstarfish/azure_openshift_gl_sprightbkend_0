locals {
  loc_name = replace(lower(var.location), " ", "")
}

resource "random_string" "resource_code" {
  length  = 5
  upper   = false
  special = false
}

resource "azurerm_resource_group" "tfstate_rg" {
  name     = "${var.org}-${var.infra_env}-${local.loc_name}-tfstate-rg"
  location = var.location
}

resource "azurerm_storage_account" "tfstate_sa" {
  name = lower(
    "${var.org}${var.infra_env}${local.loc_name}tfstate${random_string.resource_code.result}"
  )

  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = var.infra_env
    name        = "${var.org}-${var.infra_env}-${local.loc_name}-tfstate"
    group       = "${var.org}-applications"
  }
}

resource "azurerm_storage_container" "tfstate_store" {
  name                  = "${var.org}-${var.infra_env}-${local.loc_name}-tfstate-store"
  storage_account_id    = azurerm_storage_account.tfstate_sa.id
  container_access_type = "private"
}
