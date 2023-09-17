resource "azurerm_application_insights" "app_insights" {
  application_type                      = "web"
  daily_data_cap_in_gb                  = 100
  daily_data_cap_notifications_disabled = false
  disable_ip_masking                    = false
  force_customer_storage_for_profiler   = false
  internet_ingestion_enabled            = true
  internet_query_enabled                = true
  local_authentication_disabled         = false
  location                              = azurerm_resource_group.rg.location
  name                                  = "costreport-${random_string.suffix.result}"
  resource_group_name                   = azurerm_resource_group.rg.name
  retention_in_days                     = 90
  sampling_percentage                   = 0
  tags                                  = {}
  workspace_id                          = azurerm_log_analytics_workspace.log.id
}