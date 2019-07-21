resource "google_compute_firewall" "firewall_ssh" {
  name     = "${var.env_name}-default-allow-ssh"
  network  = "default"
  priority = "65534"

  allow {
    protocol = "tcp"
    ports    = "${var.allow_ports}"
  }

  source_ranges = ["${var.source_ranges}"]
}
