
variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "project_id" {
  type        = string
  description = "The GCP project ID."
  nullable    = false
}

#CE

variable "machine_type" {
  default = "e2-medium"
}

variable "image" {
  type    = string
  default = "debian-12"
}

variable "nw-ip" {
  type    = string
  default = "10.1.0.10"

}