output "subnet_name" {
  description = "Name of the subnet."
  value       = azurerm_subnet.this.name
}

output "subnet_id" {
  description = "ID of the subnet."
  value       = azurerm_subnet.this.id
}

output "subnet_address_prefixes" {
  description = "Address prefixes assigned to the subnet."
  value       = azurerm_subnet.this.address_prefixes
}
