terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "resource_group" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
}

module "service_plan" {
  source = "./modules/service_plan"

  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = module.resource_group.name
  sku_size            = var.app_service_sku_size

  depends_on = [module.resource_group]
}


module "linux_web_app" {
  source = "./modules/linux_web_app"

  name                = var.web_app_name
  location            = var.location
  resource_group_name = module.resource_group.name
  service_plan_id     = module.service_plan.id

  depends_on = [module.service_plan]
}

module "web_app_slot" {
  source = "./modules/web_app_slot"

  slot_name     = var.slot_name
  parent_app_id = module.linux_web_app.id
  repo_url      = var.repo_url
  branch        = var.branch

  depends_on = [module.linux_web_app]
}

module "swap" {
  source = "./modules/web_app_slot_swap"

  slot_id = module.web_app_slot.slot_id

  depends_on = [module.web_app_slot]
}

module "autoscale" {
  source = "./modules/autoscale"

  name                = "${var.web_app_name}-autoscale"
  resource_group_name = module.resource_group.name
  location            = var.location
  target_resource_id  = module.service_plan.id
  min_capacity        = 1
  max_capacity        = 2
  default_capacity    = 1

  depends_on = [module.swap]
}
