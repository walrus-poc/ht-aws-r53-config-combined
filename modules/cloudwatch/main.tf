locals {
  name = var.record_ips.name
  ips =  {for i in var.record_ips.ips: "${i.ip}_${i.port}" => i}
}

resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = local.ips
  alarm_name                = "dns_alarm_${each.value.ip}_${each.value.port}"
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
