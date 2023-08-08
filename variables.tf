variable "svm_vol_iterator" {
  type = map(object({
    svm_name                               = string,
    root_volume_security_style             = string,
    tags                                   = map(string),
    netbios_name                           = string,
    dns_ips                                = list(string),
    domain_name                            = string,
    password                               = string,
    username                               = string,
    file_system_administrators_group       = string,
    organizational_unit_distinguished_name = string,
    vol_map = map(object({
      name                       = string,
      junction_path              = string,
      ontap_volume_type          = string,
      security_style             = string,
      size_in_megabytes          = number,
      skip_final_backup          = bool,
      storage_efficiency_enabled = bool,
      tiering_policy_name        = string,
      cooling_period             = number
    }))
  }))
}
variable "storage_capacity" {
  type = number
}
variable "subnet_ids" {
  type = list(string)
}
variable "preferred_subnet_id" {
  type = string
}
variable "security_group_ids" {
  type = list(string)
}
variable "weekly_maintenance_start_time" {
  type = string
}
variable "deployment_type" {
  type = string
}
variable "kms_key_id" {
  type = string
}
variable "automatic_backup_retention_days" {
  type = number
}
variable "daily_automatic_backup_start_time" {
  type = string
}
variable "iops" {
  type = number
}
variable "mode" {
  type = string
}
variable "endpoint_ip_address_range" {
  type = string
}
variable "storage_type" {
  type = string
}
variable "fsx_admin_password" {
  type      = string
  sensitive = true
}
variable "route_table_ids" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
variable "throughput_capacity" {
  type = number
}