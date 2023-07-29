# Provider configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "2023tfstatestorage"
    container_name       = "tfstatecontainer"
    key                  = "secret_bridge.tfstate"
  }
  required_providers {
    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = "0.6.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.67.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "bitwarden" {
  master_password = var.bw_password
  client_id       = var.bw_client_id
  client_secret   = var.bw_client_secret
  email           = var.bw_email               # Use Demo Account
  server          = "https://vault.bitwarden.eu" # EU Server (.eu, US Server is .com)
}
