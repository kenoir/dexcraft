module "server" {
  source = "git@github.com:kenoir/terraform-aws-minecraft.git"

  mc_version = "1.15.2"

  bucket_id = local.bucket_id
  key_name  = local.key_name
  subnet_id = local.first_subnet
  vpc_id    = local.vpc_id
}

module "instance_scheduler" {
  source = "./instance_scheduler"

  ec2_instance_id = local.server_id

  start_schedule_expression = "cron(0 18 ? * Sat-Sun *)"
  stop_schedule_expression  = "cron(30 19 ? * Sat-Sun *)"
}