locals {
  project_name     = coalesce(try(var.context["project"]["name"], null), "default")
  project_id       = coalesce(try(var.context["project"]["id"], null), "default_id")
  environment_name = coalesce(try(var.context["environment"]["name"], null), "test")
  environment_id   = coalesce(try(var.context["environment"]["id"], null), "test_id")
  resource_name    = coalesce(try(var.context["resource"]["name"], null), "example")
  resource_id      = coalesce(try(var.context["resource"]["id"], null), "example_id")

  resource_url     = "${var.walrus_server_url}/#/app-management/project/${local.project_id}/environment/${local.environment_id}/page/resource/detail?id=${local.resource_id}"

  namespace = join("-", [local.project_name, local.environment_name])

  tags = {
    "Name" = join("-", [local.namespace, local.resource_name])

    "walrus.seal.io/catalog-name"     = "terraform-alicloud-rds-mysql"
    "walrus.seal.io/project-id"       = local.project_id
    "walrus.seal.io/environment-id"   = local.environment_id
    "walrus.seal.io/resource-id"      = local.resource_id
    "walrus.seal.io/project-name"     = local.project_name
    "walrus.seal.io/environment-name" = local.environment_name
    "walrus.seal.io/resource-name"    = local.resource_name
  }
}
module "r53" {
  source = "./modules/r53"
  route53_zone_name = var.route53_zone_name
  record_ips = var.record_ips
}

module "eventbridge" {
  source = "./modules/eventbridge"
  record_ips = var.record_ips
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  record_ips = var.record_ips
}
