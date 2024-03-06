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
