terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

locals {
  name = var.record_ips.name
  ips = toset([for i in var.record_ips.ips: i.ip ])
}

resource "aws_route53_zone" "private" {
  name = var.route53_zone_name

  vpc {
    vpc_id = var.vpc_id
  }
}


resource "aws_route53_record" "this" {
  for_each  = local.ips
  zone_id = aws_route53_zone.private.zone_id
  name    = local.name
  type    = "A"
  ttl     = 60
  set_identifier = each.key
  multivalue_answer_routing_policy =  true
  records        = [each.key]
}
