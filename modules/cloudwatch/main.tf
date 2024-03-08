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

resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = {for r in local.records : "${r.name}_${r.ip}_${r.port}" => r}

  alarm_name                = "dns_alarm_${each.key}"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 2
  metric_name               = "HealthStatus"
  namespace                 = "IPPortHealth"
  period                    = 60
  statistic                 = "Minimum"
  threshold                 = 1
  insufficient_data_actions = []

  dimensions = {
    IP = each.value.ip
    Port = each.value.port
  }
}
