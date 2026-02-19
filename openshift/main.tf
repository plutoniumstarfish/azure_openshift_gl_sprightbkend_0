module "openshift" {
    source    = "../../modules/openshift-cluster"
    location  = var.location
    infra_env = var.infra_env
    org       = var.org
    stage     = var.stage
    cluster_name = var.cluster_name
    master_count = var.master_count
    worker_count = var.worker_count
    
}



variable "subnet_id" {
  type = string
}

variable "vnet_cidr" {
  type = string
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
