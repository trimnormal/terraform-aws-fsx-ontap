locals {
  backup_enable = alltrue([can(var.automatic_backup_retention_days >= 1), try(length(var.daily_automatic_backup_start_time), 0) >= 1])
}