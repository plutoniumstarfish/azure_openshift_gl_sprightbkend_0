module "bastion" {
    source              = "../../modules/bastion"
    location            = var.location
    infra_env           = var.infra_env
    org                 = var.org
}