resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags = {
    (var.tag_name) = var.tag_value
  }
}
