# variables

# Azure

variable "az_rg" {
  type    = string
}

variable "az_sp_object_id" {
  type    = string
}

# Bitwarden
variable "bw_password" {
  type    = string
}

variable "bw_client_id" {
  type    = string
}

variable "bw_client_secret" {
  type    = string
}

variable "bw_email" {
  type    = string
}

variable "bw_secure_note_id" {
  type   = string
}