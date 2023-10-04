resource "aws_fsx_ontap_file_system" "this" {
  storage_capacity                  = var.storage_capacity
  subnet_ids                        = var.subnet_ids
  preferred_subnet_id               = var.preferred_subnet_id
  security_group_ids                = var.security_group_ids
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time
  deployment_type                   = var.deployment_type
  kms_key_id                        = var.kms_key_id
  automatic_backup_retention_days   = var.automatic_backup_retention_days
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  endpoint_ip_address_range         = var.endpoint_ip_address_range
  storage_type                      = var.storage_type
  fsx_admin_password                = var.fsx_admin_password
  route_table_ids                   = var.route_table_ids
  tags                              = var.tags
  throughput_capacity               = var.throughput_capacity

  dynamic "disk_iops_configuration" {
    for_each = var.iops == null ? [] : [1]
    content {
      iops = var.iops
      mode = var.mode
    }
  }

  lifecycle {
    precondition {
      condition     = local.pref_subnet == true
      error_message = "Preferred subnet must be in provided subnets"
    }
    precondition {
      condition     = local.two_subnets_for_multiaz == true
      error_message = "Multi AZ configurations require two subnets"
    }
    precondition {
      condition     = local.backup_enable == true
      error_message = "Setting automatic_backup_retention_days to 0 disables automatic backup, don't specify daily_automatic_backup_start_time"
    }
    precondition {
      condition     = local.iops == true
      error_message = "To enable custom iops set mode to USER_PROVISIONED and iops to number"
    }
  }
}

module "svm_volume" {
  source                                 = "./modules/svm_volume"
  for_each                               = var.svm_vol_iterator
  fs_id                                  = aws_fsx_ontap_file_system.this.id
  svm_name                               = each.value.svm_name
  root_volume_security_style             = each.value.root_volume_security_style
  tags                                   = each.value.tags
  netbios_name                           = each.value.netbios_name
  dns_ips                                = each.value.dns_ips
  domain_name                            = each.value.domain_name
  password                               = each.value.password
  username                               = each.value.username
  file_system_administrators_group       = each.value.file_system_administrators_group
  organizational_unit_distinguished_name = each.value.organizational_unit_distinguished_name
  vol_map                                = each.value.vol_map
  enable_active_directory_configuration  = each.value.enable_active_directory_configuration
}
