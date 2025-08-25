
variable "region" {
    default = "us-central1"
}

variable "zone" {
    default = "us-central1-a"
}

variable "project_id" {
    type = string
    sensitive = true
}

#CE

variable "machine_type" {
    default = "e2-medium"
}

variable "image" {
    type = string
    default = "Debian GNU/Linux 12"
}

variable "nw-ip" {
    type = string
    default = "10.1.1.240"

}