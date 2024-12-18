terraform {
  backend "s3" {
    bucket         = "Backend-Bucket"
    key            = "terraform/state/${var.environment}"
    region         = "eu-central-1"
    encrypt        = true
  }
}
