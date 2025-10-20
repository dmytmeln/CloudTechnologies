variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type        = list(string)
  description = "List of vnet address spaces, e.g. [\"10.20.0.0/16\"]"
}

variable "subnets" {
  type        = map(string)
  description = "Map of subnet_name => address_prefix (single prefix per subnet)"
}

variable "tags" {
  type    = map(string)
  default = {}
}
