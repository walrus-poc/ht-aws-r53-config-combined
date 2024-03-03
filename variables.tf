variable "record_ips" {
   type =  object({
     name = string
     ips = list(map(string))
   }
   )
}



variable "ip_ports" {
   type = list(
    object({
      ip  = string
      port = string
    })
  )
}