output "virtual_network_name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.this.name
}

output "virtual_network_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "virtual_network_address_space" {
  description = "Address space assigned to the virtual network."
  value       = azurerm_virtual_network.this.address_space
}
