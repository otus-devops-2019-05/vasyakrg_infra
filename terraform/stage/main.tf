terraform {
  # Версия terraform
  required_version = ">=0.11.11"
}

provider "google" {
  # Версия провайдера
  version = "2.0.0"

  # ID проекта
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source         = "../modules/app"
  public_key     = "${var.public_key}"
  zone_instance  = "${var.zone_instance}"
  app_disk_image = "${var.app_disk_image}"
}

module "db" {
  source        = "../modules/db"
  public_key    = "${var.public_key}"
  zone_instance = "${var.zone_instance}"
  db_disk_image = "${var.db_disk_image}"
}

module "vpc" {
  source = "../modules/vpc"

  # source_ranges = ["195.208.134.104/32"]
  source_ranges = ["0.0.0.0/0"]
}
