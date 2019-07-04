output "external_app_ip" {
  value = "${module.app.app_external_ip}"
}

output "external_db_ip" {
  value = "${module.db.db_external_ip}"
}
