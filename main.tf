module "r53" {
  source = "./modules/r53"
  vpc_id = var.vpc_id
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


