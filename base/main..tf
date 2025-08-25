# VPC Stanza


resource "google_compute_network" "my-vpc" {
    name = "my-vpc"
    auto_create_subnetworks = false


}

#SUBNET_WORK_ stanza
resource "google_compute_subnetwork" "my-sn" {
    name = "my-sn"
    network = google_compute_network.my-vpc.network_id
    ip_cidr_range = "10.1.0.0/24"
    region = var.region

}

# COMPUTE INSTANCE Block

resource "google_compute_instance" "obs" {
    name ="obs-ce"
    machine_type = var.machine_type
    zone = var.zone
    boot_disk {
        initialize_params {
            image = var.image
        }
    }
    network_interface {
        network = google_compute_network.my-vpc
        subnetwork = google_compute_subnetwork.my-sn
        network_ip = "10.1.1.240"
        access_config {
        }   
    }
}

#FIREWALL

resource "google_compute_firewall" "fw" {
    name = "allow"
    network = google_compute_network.my-vpc

    allow {
        protocol = "tcp"
        ports = ["22", "80","443",]
    }
    allow {
        protocol = "icmp"
    }

    source_tags = google_compute_instance.obs.tags
}
