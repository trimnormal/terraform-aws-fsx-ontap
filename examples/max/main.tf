module "advanced" {
  source                            = "trimnormal/fsx-ontap/aws"
  storage_capacity                  = 1024
  subnet_ids                        = ["<your_subnet_id>"]
  preferred_subnet_id               = "<your_subnet_id>"
  deployment_type                   = "SINGLE_AZ_1"
  throughput_capacity               = 128
  automatic_backup_retention_days   = 30
  daily_automatic_backup_start_time = "05:00"
  enable_disk_iops_configuration    = true
  iops                              = 1000
  mode                              = "USER_PROVISIONED"
  fsx_admin_password                = "dont_put_passwords_in_plain_text"
  #kms_key_id = "keyID"
  route_table_ids    = ["routetableID"]
  security_group_ids = ["securityGroupID"]
  storage_type       = "SSD"
  svm_vol_iterator = {
    "svm1" = {
      svm_name                               = "svm1"
      root_volume_security_style             = "NTFS"
      tags                                   = null
      enable_active_directory_configuration  = true
      netbios_name                           = "svm1"
      dns_ips                                = local.dns_ips
      domain_name                            = local.domain_name
      password                               = local.password
      username                               = local.username
      file_system_administrators_group       = local.file_system_administrators_group
      organizational_unit_distinguished_name = local.organizational_unit_distinguished_name
      vol_map = {
        "vol1" = {
          name                       = "vol1"
          junction_path              = "/vol1"
          ontap_volume_type          = "RW"
          security_style             = "NTFS"
          size_in_megabytes          = 100
          skip_final_backup          = false
          storage_efficiency_enabled = true
          tiering_policy_name        = "SNAPSHOT_ONLY"
          cooling_period             = 2
          enable_tiering_policy      = true
        },
        "vol2" = {
          name                       = "vol2"
          junction_path              = "/vol2"
          ontap_volume_type          = "RW"
          security_style             = "UNIX"
          size_in_megabytes          = 200
          skip_final_backup          = false
          storage_efficiency_enabled = true
          tiering_policy_name        = "SNAPSHOT_ONLY"
          cooling_period             = 2
          enable_tiering_policy      = true
        },
        "vol3" = {
          name                       = "vol3"
          junction_path              = "/vol3"
          ontap_volume_type          = "RW"
          security_style             = "MIXED"
          size_in_megabytes          = 200
          skip_final_backup          = true
          storage_efficiency_enabled = true
          tiering_policy_name        = null
          cooling_period             = null
          enable_tiering_policy      = false
        },
      }
    },
    "svm2" = {
      svm_name                               = "svm2"
      root_volume_security_style             = "NTFS"
      tags                                   = null
      enable_active_directory_configuration  = true
      netbios_name                           = "svm2"
      dns_ips                                = local.dns_ips
      domain_name                            = local.domain_name
      password                               = local.password
      username                               = local.username
      file_system_administrators_group       = local.file_system_administrators_group
      organizational_unit_distinguished_name = local.organizational_unit_distinguished_name
      vol_map = {
        "vol1" = {
          name                       = "vol1"
          junction_path              = "/vol1"
          ontap_volume_type          = "RW"
          security_style             = "NTFS"
          size_in_megabytes          = 100
          skip_final_backup          = false
          storage_efficiency_enabled = true
          tiering_policy_name        = "SNAPSHOT_ONLY"
          cooling_period             = 2
          enable_tiering_policy      = true
        }
      }
    }
  }
} 