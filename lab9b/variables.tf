variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg9b"
}

variable "subscription_id" {
  type = string
}

variable "container_group_name" {
  type    = string
  default = "az104-c1"
}

variable "container_name" {
  type    = string
  default = "az104-c1-container"
}

variable "container_image" {
  type    = string
  default = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
}

variable "dns_name_label" {
  type    = string
  default = "az104-aci-unique-melnyk-lab9b"
}

variable "container_cpu" {
  type    = number
  default = 1
}

variable "container_memory" {
  type    = number
  default = 1.5
}
