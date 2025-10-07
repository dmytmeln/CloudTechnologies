variable "name" {
  type        = string
  description = "Name of the Application Security Group"
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
