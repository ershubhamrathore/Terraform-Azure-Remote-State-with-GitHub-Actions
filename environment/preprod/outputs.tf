output "resource_group_name" {
  description = "Name of the deployed resource group."
  value       = module.resource_group.resource_group_name
}

output "resource_group_location" {
  description = "Azure region for the deployed resource group."
  value       = module.resource_group.resource_group_location
}

output "resource_group_id" {
  description = "Resource ID of the deployed resource group."
  value       = module.resource_group.resource_group_id
}

output "virtual_network_name" {
  description = "Name of the deployed virtual network."
  value       = module.virtual_network.virtual_network_name
}

output "subnet_name" {
  description = "Name of the deployed subnet."
  value       = module.subnet.subnet_name
}

output "storage_account_name" {
  description = "Name of the deployed storage account."
  value       = module.storage_account.storage_account_name
}
