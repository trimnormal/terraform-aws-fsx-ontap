variable "fs_id" {
  type = string
}
variable "svm_name" {
  type = string
}
variable "root_volume_security_style" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "netbios_name" {
  type = string
}
variable "dns_ips" {
  type = list(string)
}
variable "domain_name" {
  type = string
}
variable "password" {
  type      = string
  sensitive = true
}
variable "username" {
  type = string
}
variable "file_system_administrators_group" {
  type = string
}
variable "organizational_unit_distinguished_name" {
  type = string
}
variable "vol_map" {
  type = map(object({ name = string,
    junction_path              = string,
    ontap_volume_type          = string,
    security_style             = string,
    size_in_megabytes          = number,
    skip_final_backup          = bool,
    storage_efficiency_enabled = bool,
    tiering_policy_name        = string,
  cooling_period = number }))
}