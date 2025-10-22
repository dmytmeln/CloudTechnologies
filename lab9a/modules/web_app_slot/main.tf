resource "azurerm_linux_web_app_slot" "this" {
  name           = var.slot_name
  app_service_id = var.parent_app_id

  site_config {
    application_stack {
      php_version = "8.2"
    }
    always_on = true
  }
}

resource "azurerm_app_service_source_control_slot" "this" {
  slot_id                = azurerm_linux_web_app_slot.this.id
  repo_url               = var.repo_url
  branch                 = var.branch
  use_manual_integration = true

  depends_on = [azurerm_linux_web_app_slot.this]
}
