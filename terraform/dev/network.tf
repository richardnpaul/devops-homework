module "vpc_network" {
  source = "../common/network"
  network = var.network
}
