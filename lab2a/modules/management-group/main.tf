resource "azurerm_management_group" "az104_mg1" {
  name         = var.management_group_id
  display_name = var.management_group_display_name
}
