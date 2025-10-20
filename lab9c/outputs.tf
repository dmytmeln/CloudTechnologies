output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.resource_group.name
    id   = module.resource_group.id
  }
}

output "log_analytics" {
  value = module.log_analytics.id
}

output "containerapps_environment" {
  description = "Container Apps Environment details"
  value = {
    name                           = module.containerapps_env.name
    id                             = module.containerapps_env.id
    location                       = module.containerapps_env.location
    internal_load_balancer_enabled = module.containerapps_env.internal_load_balancer_enabled
  }
}

output "container_app" {
  description = "Container App details"
  value = {
    name = module.container_app.name
    id   = module.container_app.id
    fqdn = module.container_app.latest_revision_fqdn
  }
}
