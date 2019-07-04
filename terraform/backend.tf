terraform {
  backend "gcs" {
    bucket = "terra2-bucket-main"
    prefix = "conf"
  }
}
