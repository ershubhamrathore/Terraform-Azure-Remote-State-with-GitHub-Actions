variable "name" {
  description = "Name of the Azure resource group."
  type        = string
  default     = "CHANGE_ME_RESOURCE_GROUP_NAME"
}

variable "location" {
  description = "Azure region for the resource group."
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Tags to apply on the resource group."
  type        = map(string)
  default = {
    project     = "terraform-azure-remote-state"
    environment = "CHANGE_ME_ENVIRONMENT"
    managed-by  = "terraform"
  }
}
