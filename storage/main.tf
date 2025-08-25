provider "google" {
  region  = var.region
  project = var.project-id
  zone    = var.zone
}

resource "google_storage_bucket" "environment_bucket4509" {
  name     = "remotestate_${var.project-id}"
  location = "US"
  versioning {
    enabled = true
  }
}

