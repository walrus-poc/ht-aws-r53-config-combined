locals {
  record_sets = {for rs in var.record_sets: rs.name => rs}
}

resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = local.record_sets

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
