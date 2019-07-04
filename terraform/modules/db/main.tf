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
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name = "allow-mongo-default"

  # name of net
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_ranges = ["${var.external_ip_app}/32"]
  target_tags   = ["reddit-db"]
  source_tags   = ["reddit-app"]
}
