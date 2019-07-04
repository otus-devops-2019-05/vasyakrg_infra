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
  private_key    = "${var.private_key}"
  zone_instance  = "${var.zone_instance}"
  app_disk_image = "${var.app_disk_image}"
  db_external_ip = "${module.db.db_external_ip}"
  install_app    = "true"

  # depends_on     = [module.db]
}

module "db" {
  source          = "../modules/db"
  public_key      = "${var.public_key}"
  zone_instance   = "${var.zone_instance}"
  db_disk_image   = "${var.db_disk_image}"
  external_ip_app = "${module.app.app_external_ip}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["${var.access_range}"]
}
