locals {
  record_sets = {for rs in var.record_sets: rs.name => rs}
}

resource "aws_scheduler_schedule" "this" {
  for_each = local.record_sets

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
