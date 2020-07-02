# Create Blob Storage For Static Website
resource "azurerm_storage_account" "blog_blob" {
  name                      = "AZ-${var.loc_prefix}-SR-${var.prefix}-${var.int_prefix}"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_virtual_network.rg.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_storage_container" "blog_blob" {
  name                  = "AZ-${var.loc_prefix}-SC-${var.prefix}-${var.int_prefix}"
  storage_account_name  = azurerm_storage_account.blog_blob.name
  container_access_type = "private"
}