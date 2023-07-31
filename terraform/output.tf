# output "dbadmin_password" {
#     value = data.bitwarden_item_secure_note.exampleservice-configuration.fields[0].value 
# }

# Azure Output

output "kv_id" {
    value = azurerm_key_vault.keyvault.id
}

output "kv_name" {
    value = azurerm_key_vault.keyvault.name
}

output "kv_uri" {
    value = azurerm_key_vault.keyvault.vault_uri
}

output "kv_access_policy_id" {
    value = azurerm_key_vault_access_policy.kvap_master.id
}

output "kv_access_policy_object_id" {
    value = azurerm_key_vault_access_policy.kvap_master.object_id
}


# Bitwarden Output (Demonstration Only)

output "secure_note_id" {
    value = data.bitwarden_item_secure_note.exampleservice-configuration.id
}

output "secure_note_name" {
    value = data.bitwarden_item_secure_note.exampleservice-configuration.name
}

output "secure_note_fields" {
    value = data.bitwarden_item_secure_note.exampleservice-configuration.notes
    sensitive = true
}

# Bitwarden Output (Helper Functions, Demonstration Only)
#
# You need to set sensitive = true for each output that contains a secret
# to prevent the secret from being printed to the console, thus actively 
# opting in to add them to outputs.

output "secure_note_fields_map" {
    value = local.bw_secret_map
    sensitive = true
}

output "dbadmin_password" {
    value = local.bw_secret_map["dbadmin"]
    sensitive = true
}