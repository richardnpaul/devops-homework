module "gke" {
  source  = "../common/gke"
  network = var.network
}
