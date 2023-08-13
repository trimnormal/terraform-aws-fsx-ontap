output "volume_attributes" {
  value = { for k, v in aws_fsx_ontap_volume.this : k => { "arn" : v.arn, "id" : v.id, "uuid" : v.uuid } }
  description = "ARN, ID, UUID of volumes"
}

output "vm_management_endpoints" {
  value = aws_fsx_ontap_storage_virtual_machine.this.endpoints[0]["management"][0]["ip_addresses"]
  description = "Management IP addresses of storage virtual machines"
}
