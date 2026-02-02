variable "location" {
    type = string
    description = "Location to deploy resources"
    default = "EAST US"
}

variable "infra_env" {
    type = string
    description = "subscription environment dev, npr, prp, prd"
    default = "dev"
    
    
variable "organization" {
    type = string
    description = "organization/company"
    default = "gni"
}
