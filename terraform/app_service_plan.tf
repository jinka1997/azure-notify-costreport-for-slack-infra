resource "azurerm_service_plan" "app_server" {
  location                 = azurerm_resource_group.rg.location
  name                     = "costreport-app-server-${random_string.suffix.result}"
  os_type                  = "Linux"
  per_site_scaling_enabled = false
  resource_group_name      = azurerm_resource_group.rg.name
  sku_name                 = "Y1"
  tags                     = {}
  zone_balancing_enabled   = false
}