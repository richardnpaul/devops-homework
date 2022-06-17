resource "google_service_account" "default" {
  account_id   = "gke-service-account-id"
  display_name = "GKE Service Account"
}

resource "google_container_cluster" "primary" {
  name                     = "gke-cluster"
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
  }


  node_config {
    service_account = google_service_account.default.email
  }

  lifecycle {
    ignore_changes = [node_config]
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "primary-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
