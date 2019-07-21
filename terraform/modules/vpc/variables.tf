variable "source_ranges" {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable "allow_ports" {
  default = ["22"]
}

variable "env_name" {
  default = ""
}
