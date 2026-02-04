variable "location" {
    type = string
    description = "Location to deploy resources"
    default = "EAST US"
}

variable "infra_env" {
    type = string
    description = "subscription environment dev, npr, prp, prd"
    default = "dev"
}
    
variable "org" {
    type = string
    description = "organization/company"
    default = "gni"
}

variable "address_space" {
    type = list(string)
    description = "address space or cidr"
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    address_prefix = string
  }))
}
