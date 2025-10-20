output "resource_group" {
  description = "Resource group details"
  value = {
    id   = module.resource_group.id
    name = module.resource_group.name
  }
}

output "vnets" {
  description = "Virtual network details"
  value = { for k, v in var.vnets : k => {
    id      = module.vnets[k].vnet_id
    name    = module.vnets[k].vnet_name
    subnets = module.vnets[k].subnet_details
    }
  }
}

output "asg" {
  value = {
    id   = module.asg_web.asg_id
    name = module.asg_web.asg_name
  }
}

output "nsg" {
  value = {
    id            = module.nsg_secure.nsg_id
    name          = module.nsg_secure.nsg_name
    inbound_rule  = module.nsg_secure.inbound_rule_id
    outbound_rule = module.nsg_secure.outbound_rule_id
  }
}

output "dns_zones" {
  value = {
    public = {
      id           = module.dns_public.zone_id
      name         = module.dns_public.zone_name
      name_servers = module.dns_public.name_servers
      a_records    = module.dns_public.a_records
    }
    private = {
      id        = module.dns_private.zone_id
      name      = module.dns_private.zone_name
      a_records = module.dns_private.a_records
    }
  }
}

