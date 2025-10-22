variable "name" {
  type        = string
  description = "Name for the autoscale setting"
  default     = "webapp-autoscale"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the autoscale setting"
}

variable "location" {
  type        = string
  description = "Location for the autoscale setting"
  default     = "East US"
}

variable "target_resource_id" {
  type        = string
  description = "Target resource ID to attach autoscale to (e.g. service plan id)"
}

variable "min_capacity" {
  type        = number
  description = "Minimum number of instances"
  default     = 1
}

variable "max_capacity" {
  type        = number
  description = "Maximum number of instances (Maximum burst)"
  default     = 2
}

variable "default_capacity" {
  type        = number
  description = "Default instance count"
  default     = 1
}