output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.resource_group.name
    id   = module.resource_group.id
  }
}

output "container_instance" {
  description = "Деталі Azure Container Instance"
  value = {
    name       = module.container_instance.name
    id         = module.container_instance.id
    fqdn       = module.container_instance.fqdn
    ip_address = module.container_instance.ip_address
  }
}
