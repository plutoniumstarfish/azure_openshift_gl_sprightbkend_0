module "openshift" {
    source          = "../../modules/openshift-cluster"
    location        = var.location
    infra_env       = var.infra_env
    org             = var.org
    stage           = var.stage
    cluster_name    = var.cluster_name
    master_count    = var.master_count
    worker_count    = var.worker_count
    zones           = var.zones
    master_size     = var.master_size
    worker_size     = var.worker_size
    admin_username  = var.admin_username
    ssh_public_key  = var.ssh_public_key
    source_image    = var.source_image
    os_disk         = var.os_disk
}
