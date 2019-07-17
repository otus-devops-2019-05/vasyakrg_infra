variable db_disk_image_family {
  description = "Disk image for reddit db"
  default     = "reddit-base-db"
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
