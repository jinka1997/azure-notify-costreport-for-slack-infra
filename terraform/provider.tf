provider "azurerm" {
  features {}
}

terraform {
  required_version = "=1.5.4"
  backend "local" {
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.71.0"
    }
  }
}
