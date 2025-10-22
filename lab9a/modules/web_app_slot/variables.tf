variable "slot_name" {
  type        = string
  description = "Name of the deployment slot (e.g. staging)"
  default     = "staging"
}

variable "parent_app_id" {
  type        = string
  description = "ID of the parent web app (azurerm_linux_web_app.this.id)"
}

variable "repo_url" {
  type = string
}

variable "branch" {
  type    = string
  default = "master"
}
