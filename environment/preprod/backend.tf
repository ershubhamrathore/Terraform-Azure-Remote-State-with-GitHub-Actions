terraform {
  backend "azurerm" {
    resource_group_name  = "CHANGE_ME_TF_STATE_RESOURCE_GROUP"
    storage_account_name = "CHANGE_ME_TF_STATE_STORAGE_ACCOUNT"
    container_name       = "CHANGE_ME_TF_STATE_CONTAINER"
    key                  = "preprod.terraform.tfstate"
  }
}
