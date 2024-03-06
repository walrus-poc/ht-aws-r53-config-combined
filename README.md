## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.24.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch"></a> [cloudwatch](#module\_cloudwatch) | ./modules/cloudwatch | n/a |
| <a name="module_eventbridge"></a> [eventbridge](#module\_eventbridge) | ./modules/eventbridge | n/a |
| <a name="module_r53"></a> [r53](#module\_r53) | ./modules/r53 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_record_ips"></a> [record\_ips](#input\_record\_ips) | n/a | <pre>object({<br>     name = string<br>     ips = list(object({<br>       ip = string<br>       port = string<br>     }<br>    ))<br>   }<br>   )</pre> | n/a | yes |
| <a name="input_route53_zone_name"></a> [route53\_zone\_name](#input\_route53\_zone\_name) | n/a | `string` | `"test.com"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | `"vpc-0139b3c3e759664b8"` | no |

## Outputs

No outputs.
