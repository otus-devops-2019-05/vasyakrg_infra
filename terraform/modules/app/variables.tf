variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-ruby-1562141405"
}

variable "zone_instance" {
  default = "europe-west1-b"
}

variable "count_instance" {
  description = "count of instances"
  default     = "1"
}

variable public_key {
  description = "public key used for ssh access"
}

variable private_key {
  description = "private key used for ssh access"
}

variable "install_app" {
  default = "true"
}

variable "db_external_ip" {
  default = "127.0.0.1"
}
