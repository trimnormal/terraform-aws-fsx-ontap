## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_fsx_ontap_storage_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/aws/5.2.0/docs/resources/fsx_ontap_storage_virtual_machine) | resource |
| [aws_fsx_ontap_volume.this](https://registry.terraform.io/providers/hashicorp/aws/5.2.0/docs/resources/fsx_ontap_volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_ips"></a> [dns\_ips](#input\_dns\_ips) | (Required) A list of up to three IP addresses of DNS servers or domain controllers in the self-managed AD directory. | `list(string)` | `null` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Required) The fully qualified domain name of the self-managed AD directory. For example, corp.example.com. | `string` | `null` | no |
| <a name="input_enable_active_directory_configuration"></a> [enable\_active\_directory\_configuration](#input\_enable\_active\_directory\_configuration) | (Required) something | `bool` | `false` | no |
| <a name="input_file_system_administrators_group"></a> [file\_system\_administrators\_group](#input\_file\_system\_administrators\_group) | (Optional) The name of the domain group whose members are granted administrative privileges for the SVM. The group that you specify must already exist in your domain. Defaults to Domain Admins. | `string` | `null` | no |
| <a name="input_fs_id"></a> [fs\_id](#input\_fs\_id) | (Required) The ID of the Amazon FSx ONTAP File System that this SVM will be created on. | `string` | n/a | yes |
| <a name="input_netbios_name"></a> [netbios\_name](#input\_netbios\_name) | (Required) The NetBIOS name of the Active Directory computer object that will be created for your SVM. This is often the same as the SVM name but can be different. AWS limits to 15 characters because of standard NetBIOS naming limits. | `string` | `null` | no |
| <a name="input_organizational_unit_distinguished_name"></a> [organizational\_unit\_distinguished\_name](#input\_organizational\_unit\_distinguished\_name) | (Optional) The fully qualified distinguished name of the organizational unit within your self-managed AD directory that the Windows File Server instance will join. For example, OU=FSx,DC=yourdomain,DC=corp,DC=com. Only accepts OU as the direct parent of the SVM. If none is provided, the SVM is created in the default location of your self-managed AD directory. | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | (Required) The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. | `string` | `null` | no |
| <a name="input_root_volume_security_style"></a> [root\_volume\_security\_style](#input\_root\_volume\_security\_style) | (Optional) Specifies the root volume security style, Valid values are UNIX, NTFS, and MIXED. All volumes created under this SVM will inherit the root security style unless the security style is specified on the volume. Default value is UNIX. | `string` | `null` | no |
| <a name="input_svm_name"></a> [svm\_name](#input\_svm\_name) | (Required) The name of the SVM. You can use a maximum of 47 alphanumeric characters, plus the underscore (\_) special character. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to assign to the storage virtual machine. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | (Required) The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. | `string` | `null` | no |
| <a name="input_vol_map"></a> [vol\_map](#input\_vol\_map) | (Required) the object used to establish volume profile of the SVM. Sourced from var.svm\_vol\_iterator in parent | <pre>map(object({ name = string,<br>    junction_path              = string,<br>    ontap_volume_type          = string,<br>    security_style             = string,<br>    size_in_megabytes          = number,<br>    skip_final_backup          = bool,<br>    storage_efficiency_enabled = bool,<br>    tiering_policy_name        = string,<br>    cooling_period             = number,<br>  enable_tiering_policy = bool }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_management_endpoints"></a> [vm\_management\_endpoints](#output\_vm\_management\_endpoints) | n/a |
| <a name="output_volume_attributes"></a> [volume\_attributes](#output\_volume\_attributes) | n/a |