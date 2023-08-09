module "simple" {
  source              = "trimnormal/fsx-ontap/aws"
  subnet_ids          = ["<your_subnet_id>"]
  preferred_subnet_id = "<your_subnet_id>"
  throughput_capacity = 128
  deployment_type     = "SINGLE_AZ_1"
}