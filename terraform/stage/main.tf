terraform {
  # Версия terraform
  required_version = ">=0.11.7"
}

provider "google" {
  # Версия провайдера
  version = "2.0.0"

  # ID проекта
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source                = "../modules/app"
  public_key            = "${var.public_key}"
  private_key           = "${var.private_key}"
  zone_instance         = "${var.zone_instance}"
  app_disk_image_family = "${var.app_disk_image_family}"
  db_internal_ip        = "${module.db.db_internal_ip}"

  install_app = "false"
}

module "db" {
  source               = "../modules/db"
  public_key           = "${var.public_key}"
  zone_instance        = "${var.zone_instance}"
  db_disk_image_family = "${var.db_disk_image_family}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["${var.access_range}"]
}
