locals {
  pref_subnet             = contains(var.subnet_ids, var.preferred_subnet_id)
  two_subnets_for_multiaz = (var.deployment_type == "MULTI_AZ_1" && length(var.subnet_ids) == 2) || var.deployment_type == "SINGLE_AZ_1"
  backup_enable           = var.automatic_backup_retention_days == 0 && var.daily_automatic_backup_start_time != null ? false : true
  iops                    = var.iops != null && var.mode == "USER_PROVISIONED" ? true : var.iops == null && var.mode == null ? true : false
}