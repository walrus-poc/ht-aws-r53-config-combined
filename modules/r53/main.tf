data "aws_route53_zone" "existing" {
  name = var.route53_zone_name
}

resource "aws_route53_zone" "private" {
  count = data.aws_route53_zone.existing.zone_id != null ? 0 : 1
  name  = var.route53_zone_name

  vpc {
    vpc_id = var.vpc_id
  }
}

locals {
  zone_id = data.aws_route53_zone.existing.zone_id != null ? data.aws_route53_zone.existing.zone_id : aws_route53_zone.private[0].zone_id
  name = var.record_ips.name
  ips = toset([for i in var.record_ips.ips: i.ip ])
}

resource "aws_route53_record" "this" {
  for_each  = local.ips
  zone_id = local.zone_id
  name    = local.name
  type    = "A"
  ttl     = 60
  set_identifier = each.key
  multivalue_answer_routing_policy =  true
  records        = [each.key]
}
