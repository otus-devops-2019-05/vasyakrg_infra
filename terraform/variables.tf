variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
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

variable private {
  description = "private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable "app_port" {
  default = "9292"
}
