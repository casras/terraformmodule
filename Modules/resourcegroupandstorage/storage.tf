resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
  
  tags = {
    environment = var.tag_environment
    managed-by = var.tag_managedby
  }
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storageaccount_name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.tag_environment
    managed-by = var.tag_managedby
  }
}