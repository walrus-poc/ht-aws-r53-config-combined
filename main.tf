module "r53" {
  source = "./modules/r53"
  vpc_id = "vpc-0139b3c3e759664b8"
  route53_zone_name = "example.com"
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


