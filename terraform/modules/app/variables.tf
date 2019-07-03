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
