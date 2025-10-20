variable "name" {
  description = "Container App name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "containerapps_environment_id" {
  description = "ID of the Container App Environment"
  type        = string
}

variable "revision_mode" {
  description = "Revision mode for the Container App (Single or Multiple)"
  type        = string
  default     = "Single"
}

variable "image" {
  description = "Container image"
  type        = string
  default     = "mcr.microsoft.com/k8se/quickstart:latest"
}

variable "cpu" {
  description = "vCPU for container"
  type        = number
  default     = 0.25
}

variable "memory" {
  description = "Memory for container"
  type        = string
  default     = "0.5Gi"
}

variable "target_port" {
  description = "Ingress target port"
  type        = number
  default     = 80
}

variable "enable_ingress_external" {
  description = "Allow external ingress"
  type        = bool
  default     = true
}
