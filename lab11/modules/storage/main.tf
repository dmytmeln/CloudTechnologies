resource "random_string" "sa_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_account_name_prefix}${random_string.sa_suffix.result}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "fileshare" {
  name               = "fileshare"
  storage_account_id = azurerm_storage_account.sa.id
  quota              = 50
}
# todo DELETE fileshare