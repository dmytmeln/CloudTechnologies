resource "azurerm_container_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type         = "Linux"
  ip_address_type = "Public"
  dns_name_label  = var.dns_name_label


  container {
    name   = var.container_name
    image  = var.image
    cpu    = var.cpu
    memory = var.memory


    ports {
      port     = 80
      protocol = "TCP"
    }
  }

}
