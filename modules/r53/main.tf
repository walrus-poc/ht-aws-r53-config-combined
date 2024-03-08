locals {
  record_sets = {for rs in var.record_sets: rs.name => rs}
  records = flatten([
    for rs in var.record_sets : [
      for record in rs.records : {
        name = rs.name
        ip = record.ip
        port = record.port
      }
    ]
  ])
}

data "aws_route53_zone" "private" {
  name = "${var.route53_zone_name}." 
  private_zone = true 
}

resource "aws_route53_record" "this" {
  for_each  = {for r in local.records : "${r.name}_${r.ip}_${r.port}" => r}
  zone_id = data.aws_route53_zone.private.zone_id
  name    = each.key
  type    = "A"
  ttl     = 60
  set_identifier = each.key
  multivalue_answer_routing_policy =  true
  records        = [each.value.ip]
}
