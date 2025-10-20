resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_id    = data.azurerm_storage_account.this.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "this" {
  name                   = var.blob_relative_path
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.this.name
  type                   = "Block"
  access_tier            = "Hot"
  source                 = "${path.module}/${var.file_name}"

  depends_on = [azurerm_storage_container.this]
}

resource "azurerm_storage_container_immutability_policy" "this" {
  storage_container_resource_manager_id = azurerm_storage_container.this.resource_manager_id
  immutability_period_in_days           = var.retention_days

  depends_on = [azurerm_storage_blob.this]
}

data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

data "azurerm_storage_account_blob_container_sas" "this" {
  connection_string = data.azurerm_storage_account.this.primary_connection_string
  container_name    = azurerm_storage_container.this.name

  start  = timeadd(timestamp(), "-24h")
  expiry = timeadd(timestamp(), "24h")

  ip_address = var.client_ip_address

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }

  depends_on = [azurerm_storage_container.this]
}
