variable "lambda_arn" {
  type = string 
  default = "arn:aws:lambda:ap-northeast-1:831691747030:function:dns_health_check"
}

variable "eventbridge_arn" {
  type = string
  default = "arn:aws:iam::831691747030:role/iam_for_dns_eventbridge"
}

variable "record_ips" {
}
