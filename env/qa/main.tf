terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "environment" {}
variable "location" {}
variable "resource_group_name" {}
variable "storage_account_name" {}

module "storage" {
  source = "../../modules/storage"

  environment          = var.environment
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name
}

output "resource_group_name" {
  value = module.storage.resource_group_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
