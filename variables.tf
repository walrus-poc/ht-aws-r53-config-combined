variable "record_ips" {
   type =  object({
     name = string
     ips = list(map(string))
   }
   )
}
