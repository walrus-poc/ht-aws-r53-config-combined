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

variable "enabled" {
  description = "Flag to enable or disable the sending of emails"
  type        = bool
  default     = "true"
}

variable "from" {
  description = "From address for email"
  type = string
}

variable "to" {
  description = "Email recipients"
  type        = list(string)
}

variable "subject" {
  description = "Email subject template"
  type = string
}

variable "body" {
  description = "Email body template"
  default = "Hello, Peng. This is a default message."
}

variable "username" {
  description = "Username to authenticate with the SMTP server"
  type        = string
}

variable "password" {
  description = "Password to authenticate with the SMTP server"
  type        = string
}

variable "host" {
  description = "SMTP Host"
  type = string
  default     = "smtp.feishu.cn"
}

variable "port" {
  description = "SMTP Port"
  type = string
  default     = "587"
}

variable "vars" {
  description = "Parameters to pass to the body template"
  default     = {}
}

# We recommend the following tool:
#   https://github.com/wrouesnel/emailcli
variable "mail_command" {
  description = "Command to execute"
  type = string
  default     = "email"
}