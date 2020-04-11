locals {
  aws_region = "eu-west-1"
  vpc_id     = aws_default_vpc.default.id

  subnet_ids   = data.aws_subnet_ids.default.ids
  first_subnet = element(tolist(local.subnet_ids), 0)

  server_id = module.server.id[0]
  public_ip = module.server.public_ip[0]

  key_name  = "dexcraft_server"
  bucket_id = data.aws_s3_bucket.dexcraft_bucket.id
}