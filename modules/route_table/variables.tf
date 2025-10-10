variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "core_subnet_name" {
  type = string
}

variable "perimeter_subnet_name" {
  type = string
}

variable "perimeter_subnet_prefix" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "route_name" {
  type = string
}

variable "destination_cidr" {
  type = string
}

variable "next_hop_ip" {
  type = string
}
