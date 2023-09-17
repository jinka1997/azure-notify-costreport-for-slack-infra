data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "rg" {
  location = "japaneast"
  name     = "rg-costreport-${random_string.suffix.result}"
  tags     = {}
}

resource "random_string" "suffix" {
  length  = 5
  upper   = false
  lower   = true
  numeric = false
  special = false
}