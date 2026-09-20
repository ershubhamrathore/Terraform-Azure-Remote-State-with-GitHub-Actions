variable "location" {
  description = "Azure region for the resources."
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment name used in tags and naming."
  type        = string
  default     = "preprod"
}

variable "resource_group_name" {
  description = "Name of the Azure resource group to create."
  type        = string
  default     = "rg-demo-preprod"
}

variable "virtual_network_name" {
  description = "Name of the Azure virtual network."
  type        = string
  default     = "vnet-demo-preprod"
}

variable "virtual_network_address_space" {
  description = "CIDR blocks for the virtual network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet inside the virtual network."
  type        = string
  default     = "snet-demo-preprod"
}

variable "subnet_address_prefixes" {
  description = "CIDR blocks for the subnet."
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "storage_account_name" {
  description = "Globally unique Azure storage account name."
  type        = string
  default     = "CHANGE_ME_STORAGE_ACCOUNT_NAME"
}

variable "subscription_id" {
  description = "Azure subscription ID used for Terraform authentication."
  type        = string
  default     = "CHANGE_ME_SUBSCRIPTION_ID"
}

variable "tenant_id" {
  description = "Azure tenant ID used for Terraform authentication."
  type        = string
  default     = "CHANGE_ME_TENANT_ID"
}

variable "tags" {
  description = "Tags applied to the Azure resources."
  type        = map(string)
  default = {
    project     = "terraform-azure-remote-state"
    owner       = "CHANGE_ME_OWNER"
    managed-by  = "terraform"
    cost-center = "CHANGE_ME_COST_CENTER"
  }
}
