terraform {
  backend "s3" {
    bucket = "word-press-terraform-state"
    key    = "wordpress-project/terraform.tfstate"
    region = "us-east-1"
  }
}
