# terraform-aws-fsx-ontap
Terraform module to deploy fsx-ontap filesystem, storage virtual machines (SVM), and volumes. This module will deploy one file system, any number of associated SVMs, with any number of volumes attached to each SVM. Three different examples are provided to help you consume this module.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>5.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_svm_volume"></a> [svm\_volume](#module\_svm\_volume) | ./modules/svm_volume | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_fsx_ontap_file_system.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fsx_ontap_file_system) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatic_backup_retention_days"></a> [automatic\_backup\_retention\_days](#input\_automatic\_backup\_retention\_days) | (Optional) The number of days to retain automatic backups. Setting this to 0 disables automatic backups. You can retain automatic backups for a maximum of 90 days. | `number` | `null` | no |
| <a name="input_daily_automatic_backup_start_time"></a> [daily\_automatic\_backup\_start\_time](#input\_daily\_automatic\_backup\_start\_time) | (Optional) A recurring daily time, in the format HH:MM. HH is the zero-padded hour of the day (0-23), and MM is the zero-padded minute of the hour. For example, 05:00 specifies 5 AM daily. Requires automatic\_backup\_retention\_days to be set. | `string` | `null` | no |
| <a name="input_deployment_type"></a> [deployment\_type](#input\_deployment\_type) | (*Required) - The filesystem deployment type. Supports MULTI\_AZ\_1 and SINGLE\_AZ\_1. | `string` | n/a | yes |
| <a name="input_endpoint_ip_address_range"></a> [endpoint\_ip\_address\_range](#input\_endpoint\_ip\_address\_range) | (Optional) Specifies the IP address range in which the endpoints to access your file system will be created. By default, Amazon FSx selects an unused IP address range for you from the 198.19.* range. | `string` | `null` | no |
| <a name="input_fsx_admin_password"></a> [fsx\_admin\_password](#input\_fsx\_admin\_password) | (Optional) The ONTAP administrative password for the fsxadmin user that you can use to administer your file system using the ONTAP CLI and REST API. | `string` | `null` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | (Optional) - The total number of SSD IOPS provisioned for the file system. | `number` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) ARN for the KMS Key to encrypt the file system at rest, Defaults to an AWS managed KMS Key. | `string` | `null` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | (Optional) - Specifies whether the number of IOPS for the file system is using the system. Valid values are AUTOMATIC and USER\_PROVISIONED. Default value is AUTOMATIC. | `string` | `null` | no |
| <a name="input_preferred_subnet_id"></a> [preferred\_subnet\_id](#input\_preferred\_subnet\_id) | (Required) The ID for a subnet. A subnet is a range of IP addresses in your virtual private cloud (VPC). | `string` | n/a | yes |
| <a name="input_route_table_ids"></a> [route\_table\_ids](#input\_route\_table\_ids) | (Optional) Specifies the VPC route tables in which your file system's endpoints will be created. You should specify all VPC route tables associated with the subnets in which your clients are located. By default, Amazon FSx selects your VPC's default route table. | `list(string)` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | (Optional) A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups will apply to all network interfaces. | `list(string)` | `null` | no |
| <a name="input_storage_capacity"></a> [storage\_capacity](#input\_storage\_capacity) | (Optional) The storage capacity (GiB) of the file system. Valid values between 1024 and 196608. | `number` | `null` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | (Optional) - The filesystem storage type. defaults to SSD. | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | (Required) A list of IDs for the subnets that the file system will be accessible from. Upto 2 subnets can be provided. | `list(string)` | n/a | yes |
| <a name="input_svm_vol_iterator"></a> [svm\_vol\_iterator](#input\_svm\_vol\_iterator) | (Optional) an object used to configure N number of SVMs with N number of volumes on each. Default behavior is 1 svm with 1 volume and no AD configuration | <pre>map(object({<br>    svm_name                               = string,<br>    root_volume_security_style             = string,<br>    tags                                   = map(string),<br>    netbios_name                           = string,<br>    dns_ips                                = list(string),<br>    domain_name                            = string,<br>    password                               = string,<br>    username                               = string,<br>    file_system_administrators_group       = string,<br>    organizational_unit_distinguished_name = string,<br>    enable_active_directory_configuration  = bool,<br>    vol_map = map(object({<br>      name                       = string,<br>      junction_path              = string,<br>      ontap_volume_type          = string,<br>      security_style             = string,<br>      size_in_megabytes          = number,<br>      skip_final_backup          = bool,<br>      storage_efficiency_enabled = bool,<br>      tiering_policy_name        = string,<br>      cooling_period             = number,<br>      enable_tiering_policy      = bool<br>    }))<br>  }))</pre> | <pre>{<br>  "svm1": {<br>    "dns_ips": null,<br>    "domain_name": null,<br>    "enable_active_directory_configuration": null,<br>    "file_system_administrators_group": null,<br>    "netbios_name": null,<br>    "organizational_unit_distinguished_name": null,<br>    "password": null,<br>    "root_volume_security_style": null,<br>    "svm_name": "svm1",<br>    "tags": null,<br>    "username": null,<br>    "vol_map": {<br>      "vol1": {<br>        "cooling_period": null,<br>        "enable_tiering_policy": false,<br>        "junction_path": null,<br>        "name": "vol1",<br>        "ontap_volume_type": null,<br>        "security_style": null,<br>        "size_in_megabytes": 100,<br>        "skip_final_backup": null,<br>        "storage_efficiency_enabled": null,<br>        "tiering_policy_name": null<br>      }<br>    }<br>  }<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to assign to the file system. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `null` | no |
| <a name="input_throughput_capacity"></a> [throughput\_capacity](#input\_throughput\_capacity) | (Required) Sets the throughput capacity (in MBps) for the file system that you're creating. Valid values are 128, 256, 512, 1024, 2048, and 4096. | `number` | n/a | yes |
| <a name="input_weekly_maintenance_start_time"></a> [weekly\_maintenance\_start\_time](#input\_weekly\_maintenance\_start\_time) | (Optional) The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fs_dns_name"></a> [fs\_dns\_name](#output\_fs\_dns\_name) | DNS name of the filesystem |
| <a name="output_fs_endpoints"></a> [fs\_endpoints](#output\_fs\_endpoints) | File system management endpoints |
| <a name="output_fs_id"></a> [fs\_id](#output\_fs\_id) | ID of the file system |
| <a name="output_svm_volume"></a> [svm\_volume](#output\_svm\_volume) | Map of values for configured SVMs and Volumes includes: arn, id, and uuid of volumes, and management endpoints for SVMs |