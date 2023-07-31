# Contains the helper functions for this example project

# Parsing the imported secure note into a map
# Source: Bitwarden Secure Note
# Format: key=value
# Example: dbadmin=supersecret

locals {
  bw_secret_string = data.bitwarden_item_secure_note.exampleservice-configuration.notes

  bw_secret_map = {
    for entry in split("\n", local.bw_secret_string) :
    trimspace(element(split("=", entry), 0)) => trimspace(element(split("=", entry), 1))
  }
  
# Nested map for the secret entries workaround TF
  akv_secret_entries = {
    for key, value in local.bw_secret_map :
    key => {
      value = value
    }
  }
}
