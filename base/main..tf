# VPC Stanza


resource "google_compute_network" "my-vpc" {
  name                    = "my-vpc"
  auto_create_subnetworks = false


}

#SUBNET_WORK_ stanza
resource "google_compute_subnetwork" "my-sn" {
  name          = "my-sn"
  network       = google_compute_network.my-vpc.id
  ip_cidr_range = "10.1.0.0/24"
  region        = var.region

}

# COMPUTE INSTANCE Block

resource "google_compute_instance" "obs" {
  name         = "obs-ce"
  machine_type = var.machine_type
  tags         = ["allow-ssh-http-https"]
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network    = google_compute_network.my-vpc.id
    subnetwork = google_compute_subnetwork.my-sn.id
    network_ip = var.nw-ip
    access_config {
    }
  }
}

#FIREWALL

resource "google_compute_firewall" "fw" {
  name    = "allow"
  network = google_compute_network.my-vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
  allow {
    protocol = "icmp"
  }

  target_tags   = ["allow-ssh-http-https"]
  source_ranges = ["0.0.0.0/0"] # Allow from any source
}
