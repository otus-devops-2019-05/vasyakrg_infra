terraform {
  # Версия terraform
  required_version = "0.11.7"
}

provider "google" {
  # Версия провайдера
  version = "2.0.0"

  # ID проекта
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_project_metadata" "ssh_keys" {
  metadata {
    #ssh-keys = "root:${file(var.public_key_path)}"

    #     ssh-keys = <<EOF
    # appuser:${file(var.public_key_path)}
    # appuser1:${file(var.public_key_path)}
    # appuser2:${file(var.public_key_path)}
    # EOF
    #   }
    ssh-keys = <<EOF
appuser:${var.public_key}
appuser1:${var.public_key}
appuser2:${var.public_key}
EOF
  }
}

resource "google_compute_instance" "app" {
  count        = "${var.count_instance}"
  name         = "reddit-app-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone_instance}"
  tags         = ["reddit-app"]

  # add image disk
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # depricated
  # metadata {
  #   ssh-keys = "appuser:${file(var.public_key_path)}"
  # }

  # add network
  network_interface {
    network       = "default"
    access_config = {}
  }
  connection {
    type  = "ssh"
    user  = "appuser"
    agent = false

    private_key = "${var.private_key}"
  }
  # add startup service
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  # install app
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
