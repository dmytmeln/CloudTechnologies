output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.resource_group.name
    id   = module.resource_group.id
  }
}

output "vnet" {
  value = {
    name    = module.network.vnet_name
    id      = module.network.vnet_id,
    subnets = module.network.subnets
  }
}

output "vms" {
  description = "Details for created virtual machines"
  value = [
    for idx, vm in module.vms.vms : {
      name       = vm.name
      id         = vm.id
      private_ip = vm.private_ip,
      nic        = module.vms.nics[idx]
    }
  ]
}

output "network_security_group" {
  description = "Network security group details"
  value       = module.nsg.nsg
}

output "load_balancer" {
  description = "Load Balancer details"
  value = {
    name              = module.load_balancer.lb_name
    id                = module.load_balancer.lb_id
    public_ip_name    = module.load_balancer.public_ip_name
    public_ip_id      = module.load_balancer.public_ip_id
    public_ip_address = module.load_balancer.public_ip_address
  }
}

output "application_gateway" {
  description = "Application Gateway details"
  value = {
    name              = module.application_gateway.name
    id                = module.application_gateway.id
    public_ip_name    = module.application_gateway.public_ip_name
    public_ip_id      = module.application_gateway.public_ip_id
    public_ip_address = module.application_gateway.public_ip_address
  }
}
