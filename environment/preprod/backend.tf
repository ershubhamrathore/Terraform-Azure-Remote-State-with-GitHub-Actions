terraform {
  backend "azurerm" {
    resource_group_name  = "sample_rg"
    storage_account_name = "sample_storage-account"
    container_name       = "sample-blob"
    key                  = "preprod.terraform.tfstate"
  }
}
