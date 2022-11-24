data "google_project" "main" {}

data "google_service_account" "master" {
  account_id = "zeus-tf"
  project    = data.google_project.main.number
}

resource "google_container_cluster" "main" {
  name     = "flow-captain"
  location = var.gcp_zone

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "main" {
  name     = "main-pool"
  location = var.gcp_zone
  cluster  = google_container_cluster.main.name

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = "e2-micro"
    disk_type    = "pd-standard"
    disk_size_gb = 10

    service_account = data.google_service_account.master.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

provider "kubernetes" {
  host = "https://${google_container_cluster.main.endpoint}"

  client_certificate = base64decode(
    google_container_cluster.main.master_auth.0.client_certificate
  )
  client_key = base64decode(
    google_container_cluster.main.master_auth.0.client_key
  )
  cluster_ca_certificate = base64decode(
    google_container_cluster.main.master_auth.0.cluster_ca_certificate
  )
}
