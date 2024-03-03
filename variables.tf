variable "record_ips" {
   type =  object({
     name = string
     ips = list(map({
       ip = string
       port = string
     }
    ))
   }
   )
}