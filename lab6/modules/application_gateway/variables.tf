variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "appgw_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "listener_name" {
  type    = string
  default = "az104-listener"
}

variable "frontend_ip_name" {
  type    = string
  default = "publicFrontend"
}

variable "backend_address_pool_name" {
  type    = string
  default = "az104-appgwbe"
}

variable "video_backend_address_pool_name" {
  type    = string
  default = "az104-videobe"
}

variable "image_backend_address_pool_name" {
  type    = string
  default = "az104-imagebe"
}

variable "backend_http_settings_name" {
  type    = string
  default = "az104-http"
}

variable "vnet_name" {
  type = string
}

variable "nics" {
  type = list(object({
    id         = string,
    name       = string,
    private_ip = string,
  }))
}
