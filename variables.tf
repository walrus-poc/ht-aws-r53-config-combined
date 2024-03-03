variable "vpc_id" {
  type = string
  default = "vpc-0139b3c3e759664b8"
}

variable "route53_zone_name" {
  type = string
  default = "test.com"
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