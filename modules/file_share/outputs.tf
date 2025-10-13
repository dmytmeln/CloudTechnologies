output "file_share" {
  description = "Azure File share details"
  value = {
    name = azurerm_storage_share.share.name
    id   = azurerm_storage_share.share.id
  }
}

output "uploaded_file" {
  description = "Uploaded file details"
  value = {
    name = azurerm_storage_share_file.upload.name
    path = azurerm_storage_share_file.upload.source
  }
}

output "virtual_network" {
  description = "Virtual network details"
  value = {
    name          = azurerm_virtual_network.vnet.name
    id            = azurerm_virtual_network.vnet.id
    address_space = azurerm_virtual_network.vnet.address_space
  }
}

output "subnet" {
  description = "Subnet details"
  value = {
    name   = azurerm_subnet.default.name
    id     = azurerm_subnet.default.id
    prefix = azurerm_subnet.default.address_prefixes[0]
  }
}

output "network_restrictions" {
  description = "Network access rule configuration for the storage account"
  value = {
    id             = azurerm_storage_account_network_rules.restrict.id
    default_action = azurerm_storage_account_network_rules.restrict.default_action
  }
}
