variable "name" {
  type        = string
  description = "Name of the DNS zone (e.g. contoso.com)"
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "a_records" {
  description = "Map of A record names to { ttl, records } objects"
  type = map(object({
    ttl     = number
    records = list(string)
  }))
  default = {}
}
