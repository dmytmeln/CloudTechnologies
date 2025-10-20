variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg6"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for VMs (sensitive). Provide via terraform.tfvars or env TF_VAR_admin_password"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  type = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "lab06-vnet"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1ms"
}

variable "address_space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["10.60.0.0/16"]
}

variable "subnets" {
  description = "List of objects {name, cidr}"
  type        = list(object({ name = string, cidr = string }))
  default = [
    {
      name = "subnet-vm0"
      cidr = "10.60.1.0/24"
    },
    {
      name = "subnet-vm1"
      cidr = "10.60.2.0/24"
    },
    {
      name = "subnet-vm2"
      cidr = "10.60.4.0/24"
    }
  ]
}

variable "appgw_subnet_cidr" {
  description = "CIDR for Application Gateway dedicated subnet (/27 required)"
  type        = string
  default     = "10.60.3.224/27"
}

variable "lb_name" {
  type    = string
  default = "az104-lb"
}

variable "lb_public_ip_name" {
  type    = string
  default = "az104-lbpip"
}

variable "lb_frontend_ip_name" {
  type    = string
  default = "az104-fe"
}

variable "lb_backend_address_pool_name" {
  type    = string
  default = "az104-be"
}
