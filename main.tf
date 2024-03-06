module "r53" {
  source = "./modules/r53"
  route53_zone_name = var.route53_zone_name
  record_ips = var.record_ips
}

module "eventbridge" {
  source = "./modules/eventbridge"
  record_ips = var.record_ips
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  record_ips = var.record_ips
}

module "smtp-mail" {
  source = "./modules/smtp-mail"
  enabled = var.enabled
  from = var.from
  to = var.to
  subject = var.subject
  body = var.body
  username = var.username
  password = var.password
  host = var.host
  port = var.port
  vars = var.vars
  mail_command = var.mail_command
}