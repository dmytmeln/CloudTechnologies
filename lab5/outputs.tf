output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.rg.name
    id   = module.rg.id
  }
}

output "core_virtual_network" {
  description = "Core virtual network details"
  value = {
    name = var.core_vnet_name
    id   = module.vnet_core.vnet_id
  }
}

output "core_subnet" {
  description = "Core subnet details"
  value = {
    name = var.core_subnet_name
    id   = module.vnet_core.subnet_id
  }
}

output "core_virtual_machine" {
  description = "Core services VM details"
  value = {
    name       = var.core_vm_name
    id         = module.core_vm.vm_id
    private_ip = module.core_vm.private_ip
  }
}

output "manufacturing_virtual_network" {
  description = "Manufacturing virtual network details"
  value = {
    name = var.manufacturing_vnet_name
    id   = module.vnet_manufacturing.vnet_id
  }
}

output "manufacturing_subnet" {
  description = "Manufacturing subnet details"
  value = {
    name = var.manufacturing_subnet_name
    id   = module.vnet_manufacturing.subnet_id
  }
}

output "manufacturing_virtual_machine" {
  description = "Manufacturing VM details"
  value = {
    name       = var.manufacturing_vm_name
    id         = module.manufacturing_vm.vm_id
    private_ip = module.manufacturing_vm.private_ip
  }
}

output "network_watcher" {
  description = "Network Watcher details"
  value = {
    name = module.network_watcher.nw_name
    id   = module.network_watcher.nw_id
  }
}

output "connection_monitor" {
  description = "Connection Monitor details"
  value = {
    name = module.network_watcher.cm_name
    id   = module.network_watcher.cm_id
  }
}

output "core_to_manufacturing_peering" {
  description = "Peering from CoreServicesVnet to ManufacturingVnet"
  value = {
    name = module.vnet_peering.core_to_manufacturing_peering_name
    id   = module.vnet_peering.core_to_manufacturing_peering_id
  }
}

output "manufacturing_to_core_peering" {
  description = "Peering from ManufacturingVnet to CoreServicesVnet"
  value = {
    name = module.vnet_peering.manufacturing_to_core_peering_name
    id   = module.vnet_peering.manufacturing_to_core_peering_id
  }
}

output "perimeter_subnet_id" {
  value = module.core_route_table.perimeter_subnet_id
}

output "core_route_table_id" {
  value = module.core_route_table.route_table_id
}

output "perimeter_to_core_route_id" {
  value = module.core_route_table.route_id
}
