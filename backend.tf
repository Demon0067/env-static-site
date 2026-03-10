terraform {
  backend "s3" {
    bucket = "harit-terraform-state-ap-south-1"
    key    = "static-site/terraform.tfstate"
    region = "ap-south-1"
  }
}