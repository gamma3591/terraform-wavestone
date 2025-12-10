terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=4.0.0"
    }
  }
}

provider "azurerm" {
    tenant_id = var.tenant-id
    subscription_id = var.subscription-id
    resource_provider_registrations = "none"
    features {}
}