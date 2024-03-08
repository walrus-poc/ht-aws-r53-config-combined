#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}

# 
# Others
# 
variable "route53_zone_name" {
  type = string
  default = "abc.com"
}

variable "record_sets" {
  type = list(object({
    name = string
    records = list(object({
      ip = string
      port = string
    }))
  }))
}

variable "walrus_server_url" {
  type = string
  default = "https://htsc-walrus.sealio.net"
}

variable "lambda_arn" {
  type = string 
  default = "arn:aws:lambda:ap-northeast-1:831691747030:function:dns_health_check"
}

variable "eventbridge_arn" {
  type = string
  default = "arn:aws:iam::831691747030:role/iam_for_dns_eventbridge"
}