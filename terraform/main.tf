# This Tutorial demonstrates how to load secrets from a password manager 
# and use them to secretly feed them into a Key Vault.

# The following code snippet shows how to load secrets from a password manager


# Create a new Key Vault

resource "azurerm_key_vault" "keyvault" {
  name                        = "secret-bridge-bw-kv"
  location                    = data.azurerm_resource_group.rg.location
  resource_group_name         = data.azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true
  enabled_for_deployment      = true
}

# Access Policy for the current (TF-User, me)

resource "azurerm_key_vault_access_policy" "kvap_master"{
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge",
  ]
}

# Access Policy for the Service Principal (here: minimial permissions to CRUD secrets)

resource "azurerm_key_vault_access_policy" "kvap_sp"{
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.az_sp_object_id

  secret_permissions = [
    "List",
    "Set",
    "Delete",
  ]
}

# Iterate over the fields of the output_map
# Import each field as a secret in AKV

# Important: TF handles secrets as sensitive by default;
#            You need to use nonsensitive() in the for_each loop to work

resource "azurerm_key_vault_secret" "example" {
  for_each = nonsensitive(local.bw_secret_map)

  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.keyvault.id
  expiration_date = timeadd(plantimestamp(), "24h")

  # Prevent the secret value from being updated if rotated in Azure Key Vault
  lifecycle {
    ignore_changes = [
      value,
      expiration_date,
    ]
  }
}








