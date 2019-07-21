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
  env_name              = "stage"
  public_key            = "${var.public_key}"
  private_key           = "${var.private_key}"
  zone_instance         = "${var.zone_instance}"
  app_disk_image_family = "${var.app_disk_image_family}"
  db_internal_ip        = "${module.db.db_internal_ip}"
  vpc_tags              = ["stage-reddit-app"]

  install_app = "false"
}

module "db" {
  source               = "../modules/db"
  env_name             = "stage"
  public_key           = "${var.public_key}"
  zone_instance        = "${var.zone_instance}"
  db_disk_image_family = "${var.db_disk_image_family}"
  vpc_tags             = ["stage-reddit-app"]
}

module "vpc" {
  source        = "../modules/vpc"
  env_name      = "stage"
  source_ranges = ["${var.access_range}"]
  allow_ports   = ["22", "80"]
}

module "dns" {
  source        = "../modules/dns"
  dns_zone_id   = "env-dns"
  dns_zone_name = "aits.life"
  record_name   = "app1-stage"
  record_ip     = "${module.app.app_external_ip}"
}
