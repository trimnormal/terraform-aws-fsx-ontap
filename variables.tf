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
    enable_active_directory_configuration  = bool,
    vol_map = map(object({
      name                       = string,
      junction_path              = string,
      ontap_volume_type          = string,
      security_style             = string,
      size_in_megabytes          = number,
      skip_final_backup          = bool,
      storage_efficiency_enabled = bool,
      tiering_policy_name        = string,
      cooling_period             = number,
      enable_tiering_policy      = bool
    }))
  }))
  description = "(Optional) an object used to configure N number of SVMs with N number of volumes on each. Default behavior is 1 svm with 1 volume and no AD configuration"
  default = {
    "svm1" = {
      svm_name                               = "svm1"
      root_volume_security_style             = null,
      tags                                   = null,
      netbios_name                           = null,
      dns_ips                                = null,
      domain_name                            = null,
      password                               = null,
      username                               = null,
      file_system_administrators_group       = null,
      organizational_unit_distinguished_name = null,
      enable_active_directory_configuration  = null,
      vol_map = {
        "vol1" = {
          name                       = "vol1"
          size_in_megabytes          = 100
          junction_path              = null,
          ontap_volume_type          = null,
          security_style             = null,
          skip_final_backup          = null,
          storage_efficiency_enabled = null,
          tiering_policy_name        = null,
          cooling_period             = null,
          enable_tiering_policy      = false
      } }
  } }
}

variable "storage_capacity" {
  type        = number
  description = "(Optional) The storage capacity (GiB) of the file system. Valid values between 1024 and 196608."
  default     = null
  validation {
    condition     = var.storage_capacity > 1024 || var.storage_capacity < 196608
    error_message = "Valid values are between 1024 and 196608 for FS storage capacity"
  }
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) A list of IDs for the subnets that the file system will be accessible from. Upto 2 subnets can be provided."
  validation {
    condition     = length(var.subnet_ids) <= 2
    error_message = "Up to 2 subnets can be provided"
  }
}

variable "preferred_subnet_id" {
  type        = string
  description = "(Required) The ID for a subnet. A subnet is a range of IP addresses in your virtual private cloud (VPC)."
}

variable "security_group_ids" {
  type        = list(string)
  description = "(Optional) A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups will apply to all network interfaces."
  default     = null
}

variable "weekly_maintenance_start_time" {
  type        = string
  description = "(Optional) The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone."
  default     = null
  validation {
    condition     = can(regex("^(?:[1-7]:[0-2]?[0-9]:[0-5]?[0-9])?$", var.weekly_maintenance_start_time)) || var.weekly_maintenance_start_time == null
    error_message = "Start time must be in d:HH:MM format"
  }
}

variable "deployment_type" {
  type        = string
  description = "(*Required) - The filesystem deployment type. Supports MULTI_AZ_1 and SINGLE_AZ_1."
  validation {
    condition     = var.deployment_type == "SINGLE_AZ_1" || var.deployment_type == "MULTI_AZ_1"
    error_message = "Deployment type must be either SINGLE_AZ_1 or MULTI_AZ_1"
  }
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) ARN for the KMS Key to encrypt the file system at rest, Defaults to an AWS managed KMS Key."
  default     = null
}

variable "automatic_backup_retention_days" {
  type        = number
  description = "(Optional) The number of days to retain automatic backups. Setting this to 0 disables automatic backups. You can retain automatic backups for a maximum of 90 days."
  default     = null
}

variable "daily_automatic_backup_start_time" {
  type        = string
  description = "(Optional) A recurring daily time, in the format HH:MM. HH is the zero-padded hour of the day (0-23), and MM is the zero-padded minute of the hour. For example, 05:00 specifies 5 AM daily. Requires automatic_backup_retention_days to be set."
  default     = null
  validation {
    condition     = can(regex("^(?:[01]\\d|2[0-3]):[0-5]\\d$", var.daily_automatic_backup_start_time)) || var.daily_automatic_backup_start_time == null
    error_message = "Start time must be in HH:MM format"
  }
}

variable "iops" {
  type        = number
  description = "(Optional) - The total number of SSD IOPS provisioned for the file system."
  default     = null
  validation {
    condition     = var.iops == null ? true : var.iops <= 160000 ? true : false
    error_message = "Disk iops must be less than or equal to 160000"
  }
}

variable "mode" {
  type        = string
  description = "(Optional) - Specifies whether the number of IOPS for the file system is using the system. Valid values are AUTOMATIC and USER_PROVISIONED. Default value is AUTOMATIC."
  default     = null
  validation {
    condition = var.mode == null ? true : var.mode == "AUTOMATIC" ? true : var.mode == "USER_PROVISIONED" ? true : false
    error_message = "Mode must be either AUTOMATIC or USER_PROVISIONED"
  }
}

variable "endpoint_ip_address_range" {
  type        = string
  description = "(Optional) Specifies the IP address range in which the endpoints to access your file system will be created. By default, Amazon FSx selects an unused IP address range for you from the 198.19.* range."
  default     = null
}

variable "storage_type" {
  type        = string
  description = "(Optional) - The filesystem storage type. defaults to SSD."
  default     = null
}

variable "fsx_admin_password" {
  type        = string
  sensitive   = true
  description = "(Optional) The ONTAP administrative password for the fsxadmin user that you can use to administer your file system using the ONTAP CLI and REST API."
  default     = null
}

variable "route_table_ids" {
  type        = list(string)
  description = "(Optional) Specifies the VPC route tables in which your file system's endpoints will be created. You should specify all VPC route tables associated with the subnets in which your clients are located. By default, Amazon FSx selects your VPC's default route table."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the file system. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}

variable "throughput_capacity" {
  type        = number
  description = "(Required) Sets the throughput capacity (in MBps) for the file system that you're creating. Valid values are 128, 256, 512, 1024, 2048, and 4096."
  validation {
    condition     = contains([128, 256, 512, 1024, 2048, 4096], var.throughput_capacity)
    error_message = "Throughput capacity must be one of 128, 256, 512, 1024, 2048, 4096"
  }
}