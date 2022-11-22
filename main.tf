terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.41.0"
    }
  }

  # required_version = "> 1.2.8"
  required_version = "> 1.0.0"
}

provider "google" {
  credentials = var.gcp_credentials
  region      = var.gcp_region
  zone        = var.gcp_zone
}
