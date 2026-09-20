variable "name" {
  description = "Name of the virtual network."
  type        = string
  default     = "CHANGE_ME_VNET_NAME"
}

variable "resource_group_name" {
  description = "Name of the resource group where the VNet should be created."
  type        = string
  default     = "CHANGE_ME_RESOURCE_GROUP_NAME"
}

variable "location" {
  description = "Azure region for the virtual network."
  type        = string
  default     = "eastus"
}

variable "address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "dns_servers" {
  description = "Optional custom DNS servers for the virtual network."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply on the virtual network."
  type        = map(string)
  default = {
    project     = "terraform-azure-remote-state"
    environment = "CHANGE_ME_ENVIRONMENT"
    managed-by  = "terraform"
  }
}
