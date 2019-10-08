terraform {
  backend "s3" {
    bucket = "terraform-zoomrx"
    key    = "terraform"
    region = "us-east-2"
  }
}

