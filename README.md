<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/alb | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./modules/ecs | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_security_groups"></a> [security\_groups](#module\_security\_groups) | ./modules/security_groups | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | The name for ALB | `string` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The cidr\_block for VPC | `string` | n/a | yes |
| <a name="input_db_instance_name"></a> [db\_instance\_name](#input\_db\_instance\_name) | The name for the db instance | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name for db | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The password for the RDS database | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The username for the RDS database | `string` | n/a | yes |
| <a name="input_ecs_container_image"></a> [ecs\_container\_image](#input\_ecs\_container\_image) | The name for ECS container image | `string` | n/a | yes |
| <a name="input_ecs_container_name"></a> [ecs\_container\_name](#input\_ecs\_container\_name) | The name for ECS container | `string` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | The name for ECS service | `string` | n/a | yes |
| <a name="input_ecs_task_family"></a> [ecs\_task\_family](#input\_ecs\_task\_family) | The name for the ECS task | `string` | n/a | yes |
| <a name="input_local_user_ip"></a> [local\_user\_ip](#input\_local\_user\_ip) | The IP of the user who can access the ALB | `list(string)` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name for VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | n/a |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | n/a |
<!-- END_TF_DOCS -->
