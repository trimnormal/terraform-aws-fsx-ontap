variable "fs_id" {
  type        = string
  description = "(Required) The ID of the Amazon FSx ONTAP File System that this SVM will be created on."
}
variable "svm_name" {
  type        = string
  description = "(Required) The name of the SVM. You can use a maximum of 47 alphanumeric characters, plus the underscore (_) special character."
}
variable "root_volume_security_style" {
  type        = string
  description = "(Optional) Specifies the root volume security style, Valid values are UNIX, NTFS, and MIXED. All volumes created under this SVM will inherit the root security style unless the security style is specified on the volume. Default value is UNIX."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the storage virtual machine. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}
variable "netbios_name" {
  type        = string
  description = "(Required) The NetBIOS name of the Active Directory computer object that will be created for your SVM. This is often the same as the SVM name but can be different. AWS limits to 15 characters because of standard NetBIOS naming limits."
  default     = null
}
variable "dns_ips" {
  type        = list(string)
  description = "(Required) A list of up to three IP addresses of DNS servers or domain controllers in the self-managed AD directory."
  default     = null
}
variable "domain_name" {
  type        = string
  description = "(Required) The fully qualified domain name of the self-managed AD directory. For example, corp.example.com."
  default     = null
}
variable "password" {
  type        = string
  sensitive   = true
  description = "(Required) The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain."
  default     = null
}
variable "username" {
  type        = string
  description = "(Required) The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain."
  default     = null
}
variable "file_system_administrators_group" {
  type        = string
  description = "(Optional) The name of the domain group whose members are granted administrative privileges for the SVM. The group that you specify must already exist in your domain. Defaults to Domain Admins."
  default     = null
}
variable "organizational_unit_distinguished_name" {
  type        = string
  description = "(Optional) The fully qualified distinguished name of the organizational unit within your self-managed AD directory that the Windows File Server instance will join. For example, OU=FSx,DC=yourdomain,DC=corp,DC=com. Only accepts OU as the direct parent of the SVM. If none is provided, the SVM is created in the default location of your self-managed AD directory."
  default     = null
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
    cooling_period             = number,
  enable_tiering_policy = bool }))
  description = "(Required) the object used to establish volume profile of the SVM. Sourced from var.svm_vol_iterator in parent"
}
variable "enable_active_directory_configuration" {
  type        = bool
  description = "(Required) something "
  //TODO
  default = false
}