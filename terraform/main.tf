terraform {
  # Версия terraform
  required_version = "0.11.11"
}

provider "google" {
  # Версия провайдера
  version = "2.0.0"

  # ID проекта
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "${var.zone_instance}"
  tags         = ["reddit-app"]

  # add image disk
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # add network
  network_interface {
    network       = "default"
    access_config = {}
  }

  # add ssh key
  metadata {
    ssh-keys = "root:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    user  = "root"
    agent = false

    private_key = "${file(var.private_key_path)}"
  }

  # add startup service
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
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
