resource "azurerm_user_assigned_identity" "managed_id" {
  location            = azurerm_resource_group.rg.location
  name                = "cost-report-identity-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = {}
}

resource "azurerm_role_assignment" "role" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Cost Management Reader"
  principal_id         = azurerm_user_assigned_identity.managed_id.principal_id
}