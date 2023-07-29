# output "dbadmin_password" {
#     value = data.bitwarden_item_secure_note.exampleservice-configuration.fields[0].value 
# }

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

output "secure_note_fields_map" {
    value = local.output_map
    sensitive = true
}

output "dbadmin_password" {
    value = local.output_map["dbadmin"]
    sensitive = true
}