package terraform.security

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_storage_account"
  resource.change.after.tags.environment == "prod"
  resource.change.after.account_replication_type == "LRS"

  msg := "OPA DENY: LRS replication is not allowed for PROD storage accounts"
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_storage_account"
  resource.change.after.allow_nested_items_to_be_public == true

  msg := "OPA DENY: Storage account public blob access must be disabled"
}
