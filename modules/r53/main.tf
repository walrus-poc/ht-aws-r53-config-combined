locals {
  record_sets = {for rs in var.record_sets: rs.name => rs}
}

data "aws_route53_zone" "private" {
  name = "${var.route53_zone_name}." 
  private_zone = true 
}

resource "aws_route53_record" "this" {
  for_each  = local.record_sets
  zone_id = data.aws_route53_zone.private.zone_id
  name    = each.key
  type    = "A"
  ttl     = 60
  set_identifier = each.key
  multivalue_answer_routing_policy =  true
  records        = [for r in each.value.records: r.ip]
}
