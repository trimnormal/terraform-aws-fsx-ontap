output "svm_volume" {
  value = flatten(module.svm_volume[*][*])[0]
}
output "fs_id" {
  value = aws_fsx_ontap_file_system.this.id
}
output "fs_dns_name" {
  value = aws_fsx_ontap_file_system.this.dns_name
}
output "fs_endpoints" {
  value = aws_fsx_ontap_file_system.this.endpoints[0]["management"][0]["ip_addresses"]
}
