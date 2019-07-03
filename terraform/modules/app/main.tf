resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_instance" "app" {
  count        = "${var.count_instance}"
  name         = "reddit-app-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone_instance}"
  tags         = ["reddit-app"]

  metadata {
    ssh-keys = "appuser:${var.public_key}"
  }

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # name of net
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
