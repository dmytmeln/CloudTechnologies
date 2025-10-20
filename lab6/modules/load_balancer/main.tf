resource "azurerm_public_ip" "lb_pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_lb" "this" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}


resource "azurerm_lb_backend_address_pool" "be_pool" {
  name            = var.backend_address_pool_name
  loadbalancer_id = azurerm_lb.this.id
}


resource "azurerm_network_interface_backend_address_pool_association" "assoc1" {
  network_interface_id    = var.nics[0].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.be_pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "assoc2" {
  network_interface_id    = var.nics[1].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.be_pool.id
}

resource "azurerm_lb_probe" "hp" {
  name                = "az104-hp"
  loadbalancer_id     = azurerm_lb.this.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}


resource "azurerm_lb_rule" "rule" {
  name                           = "az104-lbrule"
  loadbalancer_id                = azurerm_lb.this.id
  frontend_ip_configuration_name = var.frontend_ip_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.be_pool.id]
  probe_id                       = azurerm_lb_probe.hp.id
}

