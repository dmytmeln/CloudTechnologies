resource "azurerm_network_watcher" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_connection_monitor" "this" {
  name               = var.connection_monitor_name
  location           = var.location
  network_watcher_id = azurerm_network_watcher.this.id

  endpoint {
    name               = var.source_vm_name
    target_resource_id = var.source_vm_id
  }

  endpoint {
    name               = var.destination_vm_name
    target_resource_id = var.destination_vm_id
  }

  test_configuration {
    name                      = "tcpTestRDP"
    protocol                  = "Tcp"
    test_frequency_in_seconds = 60

    tcp_configuration {
      port = 3389
    }
  }

  test_group {
    name                     = "${var.source_vm_name}-to-${var.destination_vm_name}-group"
    source_endpoints         = [var.source_vm_name]
    destination_endpoints    = [var.destination_vm_name]
    test_configuration_names = ["tcpTestRDP"]
  }

}
