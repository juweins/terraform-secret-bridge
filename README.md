# terraform-secret-bridge
Tutorial: How to move secrets from a password manager to AKV

## About this project

This repository is supplementary material for the blog post [How to move secrets from a password manager to AKV](https://julianweins.dev/projects/2023-08-01-tf-secret-bridge/).


In this project I provide a way to move secrets into your Key Vault (Azure) using Terraform. The concept of a secret bridge is a efficient way to dump secrets into your Key Vault in a repetitive and reproducable way. The secret bridge can be checked into your version control system and is therefore a good way to keep track of your secrets.

## Background

If you have a lot of secrets to configure during your Terraform deployment, or you simply have to set up a new Vault, you can quickly get lost in the amount of secrets you have to configure. (manually?) Using a secret file is a great option, but it can not be checkd into version control. So how can we keep track of our secrets and still have a reproducable way to deploy them?

-> Secret Bridge. A secure note stored in your instance of a password manager (e.g. Bitwarden, 1Password, LastPass) that contains all your secrets you want to configure. This note helps you organize your secrets and is especially helpful if you maintain a three tier architecture (dev, test, prod) and want to keep track of your secrets.


# Project Status: Enjoy ✅ :)
