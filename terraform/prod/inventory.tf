resource "local_file" "inventory" {
  content  = "${data.template_file.inventory.rendered}"
  filename = "../../ansible/inventory-prod.json"
}

data "template_file" "inventory" {
  template = "${file("../files/hosts.tpl")}"

  vars = {
    app_address = "${module.app.app_external_ip}"
    db_address  = "${module.db.db_external_ip}"
  }
}
