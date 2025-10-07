variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "asg_id" {
  type        = string
  description = "ID of the Application Security Group for inbound rule"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to associate NSG with"
}

variable "tags" {
  type    = map(string)
  default = {}
}
