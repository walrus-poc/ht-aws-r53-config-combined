variable "route53_zone_name" {
  type = string
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
