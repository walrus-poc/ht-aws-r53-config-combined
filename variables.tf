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
variable "record_ips" {
   type =  object({
     name = string
     ips = list(object({
       ip = string
       port = string
     }
    ))
   }
   )
}

variable "walrus_server_url" {
  type = string
  default = "https://walrus.sealio.net"
}
