terraform {
  backend "gcs" {
    bucket = "terra2-bucket-stage"
    prefix = "stage"
  }
}
