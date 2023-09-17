resource "azurerm_linux_function_app" "app" {
  app_settings = {
    "DailySummaryByResourceSpan" = "10"
    "ScheduleSetting"            = "0 0 12 * * *" #日本時間21時
    "SlackWebhookUrl"            = var.slack_webhook_url
    "SubscriptionId"             = data.azurerm_subscription.current.subscription_id
    "ManagedIdentityClientId"    = azurerm_user_assigned_identity.managed_id.client_id
  }
  builtin_logging_enabled    = false
  client_certificate_mode    = "Required"
  enabled                    = true
  https_only                 = true
  location                   = azurerm_resource_group.rg.location
  name                       = "costreport-${random_string.suffix.result}"
  resource_group_name        = azurerm_resource_group.rg.name
  service_plan_id            = azurerm_service_plan.app_server.id
  storage_account_access_key = azurerm_storage_account.package_store.primary_access_key
  storage_account_name       = azurerm_storage_account.package_store.name
  identity {
    identity_ids = [
      azurerm_user_assigned_identity.managed_id.id
    ]
    type = "UserAssigned"
  }

  site_config {
    always_on                              = false
    application_insights_connection_string = azurerm_application_insights.app_insights.connection_string
    application_insights_key               = azurerm_application_insights.app_insights.instrumentation_key
    application_stack {
      dotnet_version = "6.0"
    }
    cors {
      allowed_origins = [
        "https://portal.azure.com",
        "https://functions.azure.com", # 画面からの呼び出し用
      ]
      support_credentials = false
    }
  }
}
