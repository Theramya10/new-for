terraform {
  backend "s3" {
    bucket = "theramya10"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
