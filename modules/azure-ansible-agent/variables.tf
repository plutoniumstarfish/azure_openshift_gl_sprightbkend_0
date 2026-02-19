variable "cluster_name" {
  type = string
}

variable "location" {
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
