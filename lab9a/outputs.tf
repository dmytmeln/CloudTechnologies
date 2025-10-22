output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.resource_group.name
    id   = module.resource_group.id
  }
}

output "app_service_plan" {
  description = "App Service Plan details"
  value = {
    name = module.service_plan.name
    id   = module.service_plan.id
  }
}

output "web_app" {
  description = "Web App details"
  value = {
    name                  = module.linux_web_app.name
    id                    = module.linux_web_app.id
    default_site_hostname = module.linux_web_app.default_site_hostname
  }
}

output "staging_slot" {
  description = "Staging slot details"
  value = {
    name                  = module.web_app_slot.slot_name
    id                    = module.web_app_slot.slot_name
    default_site_hostname = module.web_app_slot.default_site_hostname
  }
}

output "autoscale" {
  description = "Autoscale setting details"
  value = {
    name = module.autoscale.autoscale_name
    id   = module.autoscale.autoscale_id
  }
}
