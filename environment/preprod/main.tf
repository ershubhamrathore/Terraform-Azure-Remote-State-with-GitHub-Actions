module "resource_group" {
  source = "../../modules/azurerm_rg"

  name     = var.resource_group_name
  location = var.location

  tags = merge(
    var.tags,
    {
      environment = var.environment
      workload    = "preprod"
    }
  )
}

module "virtual_network" {
  source = "../../modules/azurerm_vnet"

  name                = var.virtual_network_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  address_space       = var.virtual_network_address_space

  tags = merge(
    var.tags,
    {
      environment = var.environment
      workload    = "preprod"
    }
  )
}

module "subnet" {
  source = "../../modules/azurerm_subnet"

  name                 = var.subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
}

module "storage_account" {
  source = "../../modules/azurern_sa"

  name                            = var.storage_account_name
  resource_group_name             = module.resource_group.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = merge(
    var.tags,
    {
      environment = var.environment
      workload    = "preprod"
    }
  )
}
