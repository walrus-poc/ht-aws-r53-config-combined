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

resource "aws_scheduler_schedule" "this" {
  for_each = {for r in local.records : "${r.name}_${r.ip}_${r.port}" => r}

  name = "dns_health_check_${each.key}"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "rate(1 minutes)"

  target {
    arn      = var.lambda_arn
    role_arn = var.eventbridge_arn

    input = jsonencode({
      IP_ADDR = each.value.ip
      PORT    = each.value.port
    })
  }
}
