# AWS ALB Terraform module

Módulo Terraform para criar um Application Load Balancer na AWS

## Exemplo de utilização

* Consulte o diretório Exemplo.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http_forward](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.http_redirect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.http_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.https_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_bucket_id"></a> [access\_logs\_bucket\_id](#input\_access\_logs\_bucket\_id) | description | `string` | `""` | no |
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | A boolean flag to enable/disable access\_logs | `bool` | `false` | no |
| <a name="input_access_logs_prefix"></a> [access\_logs\_prefix](#input\_access\_logs\_prefix) | description | `string` | `""` | no |
| <a name="input_algorithm_type"></a> [algorithm\_type](#input\_algorithm\_type) | description | `string` | `"least_outstanding_requests"` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The ARN of the default SSL certificate for HTTPS listener | `string` | `""` | no |
| <a name="input_cross_zone_load_balancing_enabled"></a> [cross\_zone\_load\_balancing\_enabled](#input\_cross\_zone\_load\_balancing\_enabled) | A boolean flag to enable/disable cross zone load balancing | `bool` | `true` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | A boolean flag to enable/disable deletion protection for ALB | `bool` | `false` | no |
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | The amount of time to wait in seconds before changing the state of a deregistering target to unused | `number` | `15` | no |
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | The number of consecutive health checks successes required before considering an unhealthy target healthy | `number` | `2` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | The duration in seconds in between health checks | `number` | `15` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | The HTTP response codes to indicate a healthy check | `string` | `"200-399"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The destination for the health check request | `string` | `"/"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | The amount of time to wait in seconds before failing a health check request | `number` | `10` | no |
| <a name="input_health_check_unhealthy_threshold"></a> [health\_check\_unhealthy\_threshold](#input\_health\_check\_unhealthy\_threshold) | The number of consecutive health check failures required before considering the target unhealthy | `number` | `2` | no |
| <a name="input_http2_enabled"></a> [http2\_enabled](#input\_http2\_enabled) | A boolean flag to enable/disable HTTP/2 | `bool` | `true` | no |
| <a name="input_http_enabled"></a> [http\_enabled](#input\_http\_enabled) | A boolean flag to enable/disable HTTP listener | `bool` | `true` | no |
| <a name="input_http_ingress_cidr_blocks"></a> [http\_ingress\_cidr\_blocks](#input\_http\_ingress\_cidr\_blocks) | List of CIDR blocks to allow in HTTP security group | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_http_ingress_prefix_list_ids"></a> [http\_ingress\_prefix\_list\_ids](#input\_http\_ingress\_prefix\_list\_ids) | List of prefix list IDs for allowing access to HTTP ingress security group | `list(string)` | `[]` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The port for the HTTP listener | `number` | `80` | no |
| <a name="input_http_redirect"></a> [http\_redirect](#input\_http\_redirect) | A boolean flag to enable/disable HTTP redirect to HTTPS | `bool` | `false` | no |
| <a name="input_https_enabled"></a> [https\_enabled](#input\_https\_enabled) | A boolean flag to enable/disable HTTPS listener | `bool` | `false` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | The port for the HTTPS listener | `number` | `443` | no |
| <a name="input_https_ssl_policy"></a> [https\_ssl\_policy](#input\_https\_ssl\_policy) | The name of the SSL Policy for the listener | `string` | `"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | The time in seconds that the connection is allowed to be idle | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | A boolean flag to determine whether the ALB should be internal | `bool` | `true` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`. | `string` | `"ipv4"` | no |
| <a name="input_name_lb"></a> [name\_lb](#input\_name\_lb) | Name of ALB | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of additional security group IDs to allow access to ALB | `list(string)` | `[]` | no |
| <a name="input_stickiness_duration"></a> [stickiness\_duration](#input\_stickiness\_duration) | description | `number` | `"3600"` | no |
| <a name="input_stickiness_enable"></a> [stickiness\_enable](#input\_stickiness\_enable) | description | `bool` | `false` | no |
| <a name="input_stickiness_type"></a> [stickiness\_type](#input\_stickiness\_type) | description | `string` | `"lb_cookie"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to associate with ALB | `list(string)` | n/a | yes |
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | The name for the default target group, uses a module label name if left empty | `string` | n/a | yes |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | The port for the default target group | `number` | `80` | no |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | The protocol for the default target group HTTP or HTTPS | `string` | `"HTTP"` | no |
| <a name="input_target_group_target_type"></a> [target\_group\_target\_type](#input\_target\_group\_target\_type) | The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group | `string` | `"ip"` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the arn of lambda. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to associate with ALB | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | The DNS name of the Application Load Balancer. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Licença
Este projeto está licenciado sob a licença [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)



