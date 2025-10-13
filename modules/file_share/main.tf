resource "azurerm_storage_share" "share" {
  name                 = var.file_share_name
  storage_account_name = data.azurerm_storage_account.sa.name
  quota                = 1
  access_tier          = "TransactionOptimized"
}

resource "azurerm_storage_share_file" "upload" {
  name             = "upload.txt"
  storage_share_id = azurerm_storage_share.share.id
  source           = "${path.module}/upload.txt"

  depends_on = [azurerm_storage_share.share]
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "default" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefix]
  service_endpoints    = ["Microsoft.Storage"]

  depends_on = [azurerm_virtual_network.vnet]
}

data "azurerm_storage_account" "sa" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account_network_rules" "restrict" {
  storage_account_id = data.azurerm_storage_account.sa.id
  default_action     = "Deny"

  ip_rules = []

  virtual_network_subnet_ids = [
    azurerm_subnet.default.id
  ]

  bypass = ["AzureServices"]

  depends_on = [azurerm_subnet.default]
}
