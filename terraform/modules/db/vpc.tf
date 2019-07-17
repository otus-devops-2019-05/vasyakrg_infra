# resource "google_compute_firewall" "firewall_mongo" {
#   name = "allow-mongo-default"
#
#   # name of net
#   network = "default"
#
#   allow {
#     protocol = "tcp"
#     ports    = ["27017"]
#   }
#
#   source_ranges = ["${var.external_ip_app}/32"]
#   target_tags   = ["reddit-db"]
#   source_tags   = ["reddit-app"]
# }

