variable "name" {
  description = "Storage account name. Must be globally unique and lowercase letters and numbers only."
  type        = string
  default     = "CHANGE_ME_STORAGE_ACCOUNT_NAME"
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account is created."
  type        = string
  default     = "CHANGE_ME_RESOURCE_GROUP_NAME"
}

variable "location" {
  description = "Azure region for the storage account."
  type        = string
  default     = "eastus"
}

variable "account_tier" {
  description = "Performance tier of the storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication strategy for the storage account."
  type        = string
  default     = "LRS"
}

variable "min_tls_version" {
  description = "Minimum TLS version allowed for requests to the account."
  type        = string
  default     = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  description = "Controls whether stored blobs and files can be public."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply on the storage account."
  type        = map(string)
  default = {
    project     = "terraform-azure-remote-state"
    environment = "CHANGE_ME_ENVIRONMENT"
    managed-by  = "terraform"
  }
}
