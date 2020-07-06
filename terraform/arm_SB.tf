# Create Blob Storage For Static Website
resource "azurerm_storage_account" "blog_blob" {
  name                      = lower("AZ${var.loc_prefix}SA${var.prefix}${var.int_prefix}")
  resource_group_name       = azurerm_resource_group.static_blog.name
  location                  = azurerm_resource_group.static_blog.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  static_website {
    index_document     = "index.html"
    error_404_document = "error.html"
  }
}

resource "azurerm_storage_container" "blog_blob" {
  name                  = "AZ${var.loc_prefix}SC${var.prefix}${var.int_prefix}"
  storage_account_name  = azurerm_storage_account.blog_blob.name
  container_access_type = "private"
}
