terraform {
  backend "s3" {
    bucket         = "Backend-Bucket"
    key            = "terraform/state/Logs"
    region         = "eu-central-1"
    encrypt        = true
  }
}

