# Create Blob Storage For Static Website
resource "azurerm_storage_account" "static_website" {
  name                      = "AZ-${var.loc_prefix}-SR-${var.prefix}-${var.int_prefix}"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_virtual_network.rg.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  
  static_website {
      index_document        = "index.html"
      error_404_document    = "error.html"
  }
}

resource "azurerm_storage_container" "static_website" {
  name                  = "AZ-${var.loc_prefix}-SC-${var.prefix}-${var.int_prefix}"
  storage_account_name  = azurerm_storage_account.static_website.name
  container_access_type = "private"
}