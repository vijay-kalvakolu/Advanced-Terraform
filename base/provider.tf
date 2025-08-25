terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.49.2"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}