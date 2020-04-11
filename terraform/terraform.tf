terraform {
  backend "s3" {
    key            = "dexcraft.tfstate"
    dynamodb_table = "terraform-locktable"
    region         = "eu-west-1"
    bucket         = "infrastructure-rk"

    profile = "personal"
  }
}