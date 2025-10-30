variable "rule_name" {
  description = "The name of the alert processing rule."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group where the rule will be stored."
  type        = string
}

variable "scopes" {
  description = "A list of resource IDs to which the rule applies (e.g., subscription ID)."
  type        = list(string)
}

variable "description" {
  description = "The description of the rule."
  type        = string
}

variable "start_time" {
  description = "Start time in RFC3339 format (e.g., YYYY-MM-DDTHH:MM:SS)."
  type        = string
}

variable "end_time" {
  description = "End time in RFC3339 format (e.g., YYYY-MM-DDTHH:MM:SS)."
  type        = string
}

variable "time_zone" {
  type = string
}