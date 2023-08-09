module "advanced" {
  source              = "../../"
  storage_capacity    = 1024
  subnet_ids          = ["<your_subnet_id>"]
  preferred_subnet_id = "<your_subnet_id>"
  deployment_type     = "SINGLE_AZ_1"
  throughput_capacity = 128
  svm_vol_iterator = {
    "svm1" = {
      svm_name                               = "svm1"
      root_volume_security_style             = null
      tags                                   = null
      netbios_name                           = "svm1"
      dns_ips                                = ["<your_dns_ips>","<your_dns_ips>"]
      domain_name                            = "<your_domain_name>"
      password                               = "<your_svc_account_password>"
      username                               = "<your_svc_account_username>"
      file_system_administrators_group       = "<your_admin_group>"
      organizational_unit_distinguished_name = "<your_ou_path>"
      vol_map = {
        "vol1" = {
          name                       = "vol1"
          junction_path              = "/vol1"
          ontap_volume_type          = "RW"
          security_style             = "NTFS"
          size_in_megabytes          = 100
          skip_final_backup          = null
          storage_efficiency_enabled = null
          tiering_policy_name        = null
          cooling_period             = null
          enable_tiering_policy = null
        },
        "vol2" = {
          name                       = "vol2"
          junction_path              = "/vol2"
          ontap_volume_type          = "RW"
          security_style             = "UNIX"
          size_in_megabytes          = 200
          skip_final_backup          = null
          storage_efficiency_enabled = null
          tiering_policy_name        = null
          cooling_period             = null
          enable_tiering_policy = null
        },
      }
    },
    "svm2" = {
      svm_name                               = "svm2"
      root_volume_security_style             = null
      tags                                   = null
      netbios_name                           = "svm2"
      dns_ips                                = ["<your_dns_ips>","<your_dns_ips>"]
      domain_name                            = "<your_domain_name>"
      password                               = "<your_svc_account_password>"
      username                               = "<your_svc_account_username>"
      file_system_administrators_group       = "<your_admin_group>"
      organizational_unit_distinguished_name = "<your_ou_path>"
      vol_map = {
        "vol1" = {
          name                       = "vol1"
          junction_path              = "/vol1"
          ontap_volume_type          = "RW"
          security_style             = "NTFS"
          size_in_megabytes          = 100
          skip_final_backup          = null
          storage_efficiency_enabled = null
          tiering_policy_name        = null
          cooling_period             = null
          enable_tiering_policy = null
        }
      }
    }
  }
} 