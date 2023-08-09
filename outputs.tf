output "svm_volume" {
  value       = flatten(module.svm_volume[*][*])[0]
  description = "Map of values for configured SVMs and Volumes includes: arn, id, and uuid of volumes, and management endpoints for SVMs"
}
output "fs_id" {
  value       = aws_fsx_ontap_file_system.this.id
  description = "ID of the file system"
}
output "fs_dns_name" {
  value       = aws_fsx_ontap_file_system.this.dns_name
  description = "DNS name of the filesystem"
}
output "fs_endpoints" {
  value       = aws_fsx_ontap_file_system.this.endpoints[0]["management"][0]["ip_addresses"]
  description = "File system management endpoints"
}
