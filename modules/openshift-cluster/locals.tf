locals {
  loc_name = replace(lower(var.location), " ", "")

  env_part = (
    var.infra_env == "dev" ? "${var.infra_env}${var.stage}" :
    var.infra_env == "npr" ? var.stage :
    ""
  )

  name_parts = (
    var.infra_env == "dev" ?
    [var.org, local.env_part, local.loc_name, var.cluster_name, "rg"] :

    var.infra_env == "npr" ?
    [var.org, var.infra_env, local.env_part, local.loc_name, var.cluster_name, "rg"] :

    [var.org, var.infra_env, local.loc_name, var.cluster_name, "rg"]
  )

  rg_name = join("-", local.name_parts)
}
