module "bootstrapTfstate" {
    source    = "../../modules/networking"
    location  = var.location
    infra_env = var.infra_env
    org       = var.org
}
