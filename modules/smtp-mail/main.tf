data "template_file" "body" {
  template = var.body
  vars = var.vars
}

data "template_file" "subject" {
  template = var.subject
  vars = var.vars
}

locals {
  body    = data.template_file.body.rendered
  subject = data.template_file.subject.rendered
  command = <<EOT
  "curl -o message.tpl https://seal-demo-1303613262.cos.ap-guangzhou.myqcloud.com/message.tpl"
  "${var.mail_command} ${join(" ", var.to)}"
  EOT
}
resource "null_resource" "default" {
  count = var.enabled == "true" ? 1 : 0

  triggers = {
    subject = "${local.subject}"
    body    = file("message.tpl")
    command = "${local.command}"
  }

  provisioner "local-exec" {
    command = local.command

    environment = {
      EMAIL_FROM     = var.from
      EMAIL_SUBJECT  = local.subject
      EMAIL_BODY     = local.body
      EMAIL_PORT     = var.port
      EMAIL_HOST     = var.host
      EMAIL_USERNAME = var.username
      EMAIL_PASSWORD = var.password
    }

    on_failure = "fail"
  }

  depends_on = ["data.template_file.body", "data.template_file.subject"]
}