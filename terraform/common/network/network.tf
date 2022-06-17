resource "google_compute_network" "vpc_network" {
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name                     = "vpc-subnet"
  ip_cidr_range            = "10.1.0.0/16"
  region                   = var.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true
}
