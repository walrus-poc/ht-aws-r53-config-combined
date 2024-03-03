data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["scheduler.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_dns_eventbridge" {
  name               = "iam_for_dns_eventbridge"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

locals {
  name = var.record_ips.name
  ips =  {for i in var.record_ips.ips: "${i.ip}_${i.port}" => i}
}

resource "aws_scheduler_schedule" "this" {
  for_each = local.ips
  name = "dns_health_check_${each.value.ip}_${each.value.port}"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "rate(1 minutes)"

  target {
    arn      = var.lambda_arn
    role_arn = aws_iam_role.iam_for_dns_eventbridge.arn

    input = jsonencode({
      IP_ADDR = each.value.ip
      PORT    = each.value.port
    })
  }
}
