variable "name" {
  description = "Name of the subnet."
  type        = string
  default     = "CHANGE_ME_SUBNET_NAME"
}

variable "resource_group_name" {
  description = "Name of the resource group where the subnet is created."
  type        = string
  default     = "CHANGE_ME_RESOURCE_GROUP_NAME"
}

variable "virtual_network_name" {
  description = "Name of the virtual network hosting this subnet."
  type        = string
  default     = "CHANGE_ME_VNET_NAME"
}

variable "address_prefixes" {
  description = "CIDR ranges for the subnet."
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "service_endpoints" {
  description = "Optional Azure service endpoints for the subnet."
  type        = list(string)
  default     = []
}
