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

variable lb_private_ip_address {
  type = string
}

variable "stage" {
  type    = string
  default = ""
}

variable "cluster_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}


variable "subnet_id" {
  type = string
}

variable "bastion_subnet_id" {
  type = string
}

variable "vnet_cidr" {
  type = string
}

variable "master_count" {
  type    = number
  default = 3
}

variable "worker_count" {
  type    = number
  default = 3
}

variable "zones" {
  type    = list(string)
  default = ["1","2","3"]
}

variable "master_size" {
  type    = string
  default = "Standard_D8s_v5"
}

variable "worker_size" {
  type    = string
  default = "Standard_D8s_v5"
}

variable "bootstrap_size" {
  type    = string
  default = "Standard_D4s_v5"
}

variable "admin_username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "source_image" {
  description = "VM source image reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "os_disk" {
  description = "os disk size"
  type = object({
    caching              = string
    storage_account_type = string
    disk_size_gb         = string
  })
}
