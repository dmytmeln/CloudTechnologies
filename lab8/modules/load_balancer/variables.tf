variable "name" {
  description = "Name of the Load Balancer."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "zones" {
  description = "A list of availability zones for the LB's Public IP."
  type        = list(string)
}
