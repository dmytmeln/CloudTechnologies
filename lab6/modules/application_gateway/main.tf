resource "azurerm_subnet" "appgw_subnet" {
  name                 = "subnet-appgw"
  resource_group_name  = var.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr]
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "agw_pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "this" {
  name                = var.appgw_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  frontend_port {
    name = "frontendPort"
    port = 80
  }

  gateway_ip_configuration {
    name      = "appgw-gateway-ip"
    subnet_id = azurerm_subnet.appgw_subnet.id
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.agw_pip.id
  }

  backend_address_pool {
    name         = var.backend_address_pool_name
    ip_addresses = [var.nics[1].private_ip, var.nics[2].private_ip]
  }

  backend_address_pool {
    name         = var.image_backend_address_pool_name
    ip_addresses = [var.nics[1].private_ip]
  }


  backend_address_pool {
    name         = var.video_backend_address_pool_name
    ip_addresses = [var.nics[2].private_ip]
  }


  request_routing_rule {
    name               = "az104-gwrule"
    rule_type          = "PathBasedRouting"
    http_listener_name = var.listener_name
    url_path_map_name  = "az104-urlmap"
    priority           = 10
  }


  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }


  http_listener {
    name                           = var.listener_name
    frontend_ip_configuration_name = var.frontend_ip_name
    frontend_port_name             = "frontendPort"
    protocol                       = "Http"
  }


  url_path_map {
    name                               = "az104-urlmap"
    default_backend_address_pool_name  = var.backend_address_pool_name
    default_backend_http_settings_name = var.backend_http_settings_name


    path_rule {
      name                       = "images"
      paths                      = ["/image/*"]
      backend_address_pool_name  = var.image_backend_address_pool_name
      backend_http_settings_name = var.backend_http_settings_name
    }


    path_rule {
      name                       = "videos"
      paths                      = ["/video/*"]
      backend_address_pool_name  = var.video_backend_address_pool_name
      backend_http_settings_name = var.backend_http_settings_name
    }
  }

}
