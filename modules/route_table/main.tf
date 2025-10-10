resource "azurerm_subnet" "perimeter" {
  name                 = var.perimeter_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.perimeter_subnet_prefix]
}

resource "azurerm_route_table" "this" {
  name                          = var.route_table_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  route                         = []
  bgp_route_propagation_enabled = false
}

resource "azurerm_route" "perimeter_to_core" {
  name                   = var.route_name
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.this.name
  address_prefix         = var.destination_cidr
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.next_hop_ip
}

resource "azurerm_subnet_route_table_association" "core_assoc" {
  subnet_id      = data.azurerm_subnet.core.id
  route_table_id = azurerm_route_table.this.id
}

data "azurerm_subnet" "core" {
  name                 = var.core_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}
