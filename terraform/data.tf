data "azurerm_client_config" "current" {
}

# data "azurerm_resource_group" "rg" {
#   name = ""
# }

data "bitwarden_item_secure_note" "exampleservice-configuration" {
  id = var.bw_secure_note_id
}