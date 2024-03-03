variable "lambda_arn" {
  type = string 
  
  default = "arn:aws:lambda:ap-northeast-1:831691747030:function:dns_health_check"
}

variable "record_ips" {
}
