variable "name" {
  type = string
}


variable "location" {
  type = string
}


variable "resource_group_name" {
  type = string
}


variable "container_name" {
  type = string
}


variable "image" {
  type = string
}


variable "dns_name_label" {
  type = string
}


variable "cpu" {
  type    = number
  default = 1
}


variable "memory" {
  type    = number
  default = 1.5
}
