output "external_ip" {
  value = "${module.app.app_external_ip}"
}

# output "lb_ip" {
#   value = "${google_compute_global_address.app-load-balancer-ip.address}"
# }

