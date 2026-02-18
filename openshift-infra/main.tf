module "bootstrapTfstate" {
    source    = "../../modules/initializer"
    location  = var.location
    infra_env = var.infra_env
    org       = var.org
}
