resource "aws_fsx_ontap_storage_virtual_machine" "this" {
  file_system_id             = var.fs_id
  name                       = var.svm_name
  root_volume_security_style = var.root_volume_security_style
  tags                       = var.tags
  active_directory_configuration {
    netbios_name = var.netbios_name
    self_managed_active_directory_configuration {
      dns_ips                                = var.dns_ips
      domain_name                            = var.domain_name
      password                               = var.password
      username                               = var.username
      file_system_administrators_group       = var.file_system_administrators_group
      organizational_unit_distinguished_name = var.organizational_unit_distinguished_name
    }
  }
}

resource "aws_fsx_ontap_volume" "this" {
  for_each                   = var.vol_map
  name                       = each.value.name
  junction_path              = each.value.junction_path
  ontap_volume_type          = each.value.ontap_volume_type
  security_style             = each.value.security_style
  size_in_megabytes          = each.value.size_in_megabytes
  skip_final_backup          = each.value.skip_final_backup
  storage_efficiency_enabled = each.value.storage_efficiency_enabled
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.this.id
  tiering_policy {
    name           = each.value.tiering_policy_name
    cooling_period = each.value.cooling_period
  }
}