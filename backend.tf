terraform {
  backend "s3" {
    bucket = "your-terraform-backend-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
