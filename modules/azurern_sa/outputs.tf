output "storage_account_name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.this.name
}

output "storage_account_id" {
  description = "ID of the storage account."
  value       = azurerm_storage_account.this.id
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint for the storage account."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}
