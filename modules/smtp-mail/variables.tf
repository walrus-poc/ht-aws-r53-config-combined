
variable "enabled" {
  description = "Flag to enable or disable the sending of emails"
  type = bool
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
  type = object
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
  type = object
  default     = {}
}

# We recommend the following tool:
#   https://github.com/wrouesnel/emailcli
variable "mail_command" {
  description = "Command to execute"
  type = string
  default     = "email"
}