# This Tutorial demonstrates how to load secrets from a password manager 
# and use them to secretly feed them into a Key Vault.

# The following code snippet shows how to load secrets from a password manager

# resource "azurerm_key_vault" "keyvault" {
#   name                        = "secret-bridge-kv"
#   location                    = data.azurerm_resource_group.rg.location
#   resource_group_name         = data.azurerm_resource_group.rg.name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   sku_name                    = "standard"
#   soft_delete_enabled         = true
#   purge_protection_enabled    = false
#   enabled_for_disk_encryption = true
#   enabled_for_deployment      = true
# }

locals {
  output_string = data.bitwarden_item_secure_note.exampleservice-configuration.notes

  output_map = { 
    for entry in split("\n", local.output_string) : 
    trimspace(element(split("=", entry), 0)) => trimspace(element(split("=", entry), 1))
  }
}







