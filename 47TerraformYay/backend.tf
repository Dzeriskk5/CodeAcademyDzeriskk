terraform {
  backend "s3" {
    bucket         = "your-backend-bucket-name"
    key            = "terraform/state/${var.environment}"
    region         = "eu-central-1"
    encrypt        = true
  }
}
