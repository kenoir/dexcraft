# For the default VPC this resource is automatically imported
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnet_ids" "default" {
  vpc_id = aws_default_vpc.default.id
}

data "aws_s3_bucket" "dexcraft_bucket" {
  bucket = "backup-dexcraft"
}