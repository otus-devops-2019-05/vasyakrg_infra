data "google_compute_image" "image" {
  family = "${var.db_disk_image_family}"

  # project = "debian-cloud"
}

resource "google_compute_instance" "db" {
  # count        = "${var.count_instance}"
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "${var.zone_instance}"
  tags         = ["reddit-db"]

  metadata {
    ssh-keys = "appuser:${var.public_key}"
  }

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.image.name}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}
