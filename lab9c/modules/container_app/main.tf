resource "azurerm_container_app" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.containerapps_environment_id
  revision_mode                = var.revision_mode
  workload_profile_name        = "Consumption"

  template {
    revision_suffix = "v1"

    max_replicas = 1
    min_replicas = 0


    container {
      name   = "app"
      image  = var.image
      cpu    = var.cpu
      memory = var.memory
    }
  }


  ingress {
    allow_insecure_connections = false
    external_enabled           = var.enable_ingress_external
    target_port                = var.target_port
    traffic_weight {
      label           = "production"
      latest_revision = true
      percentage      = 100
    }
  }
}
