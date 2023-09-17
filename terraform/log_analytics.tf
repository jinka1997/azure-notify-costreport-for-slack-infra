resource "azurerm_log_analytics_workspace" "log" {
  allow_resource_only_permissions = true
  cmk_for_query_forced            = false
  daily_quota_gb                  = -1
  internet_ingestion_enabled      = true
  internet_query_enabled          = true
  local_authentication_disabled   = false
  location                        = azurerm_resource_group.rg.location
  name                            = "log-workspace-${random_string.suffix.result}"
  resource_group_name             = azurerm_resource_group.rg.name
  retention_in_days               = 30
  sku                             = "PerGB2018"
  tags                            = {}
}