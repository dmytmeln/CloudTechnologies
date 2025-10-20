variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group to create"
  type        = string
  default     = "az104-rg4"
}

variable "asg_name" {
  description = "Name of the application security group"
  type        = string
  default     = "asg-web"
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
  default     = "myNSGSecure"
}

variable "public_dns_zone_name" {
  description = "Name of the public DNS zone"
  type        = string
  default     = "cloudtechnologylab4melnykcontoso.com"
}

variable "public_dnz_zone_a_records" {
  description = "Map of A record names to { ttl, records } objects"
  type = map(object({
    ttl     = number
    records = list(string)
  }))
  default = {
    www = {
      ttl     = 1
      records = ["10.1.1.4"]
    }
  }
}

variable "private_dnz_zone_a_records" {
  description = "Map of A record names to { ttl, records } objects"
  type = map(object({
    ttl     = number
    records = list(string)
  }))
  default = {
    sensorvm = {
      ttl     = 10
      records = ["10.1.1.4"]
    }
  }
}

variable "private_dns_zone_name" {
  description = "Name of the private DNS zone"
  type        = string
  default     = "private.cloudtechnologylab4melnykcontoso.com"
}

variable "vnets" {
  type = map(object({
    name          = string
    address_space = list(string)
    subnets       = map(string)
    tags          = optional(map(string))
  }))
  default = {
    core = {
      name          = "CoreServicesVnet"
      address_space = ["10.20.0.0/16"]
      subnets = {
        SharedServicesSubnet = "10.20.10.0/24"
        DatabaseSubnet       = "10.20.20.0/24"
      }
    }


    manufacturing = {
      name          = "ManufacturingVnet"
      address_space = ["10.30.0.0/16"]
      subnets = {
        SensorSubnet1 = "10.30.20.0/24"
        SensorSubnet2 = "10.30.21.0/24"
      }
    }
  }
}
