terraform {
  backend "gcs" {
    bucket = "terra2-bucket-prod"
    prefix = "prod"
  }
}
