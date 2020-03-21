module "server" {
  source = "git@github.com:kenoir/terraform-aws-minecraft.git"

  bucket_id = local.bucket_id
  key_name  = local.key_name
  subnet_id = local.first_subnet
  vpc_id    = local.vpc_id
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnet_ids" "default" {
  vpc_id = aws_default_vpc.default.id
}

locals {
  aws_region = "eu-west-1"
  vpc_id     = aws_default_vpc.default.id

  subnet_ids   = data.aws_subnet_ids.default.ids
  first_subnet =  element(tolist(local.subnet_ids), 0)

  key_name  = "dexcraft"
  bucket_id = "backup-dexcraft"
}