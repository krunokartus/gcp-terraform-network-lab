resource "google_compute_network" "main-vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "management_subnet" {
  name          = var.management_subnet_name
  ip_cidr_range = var.management_subnet_cidr
  region        = var.region
  network       = google_compute_network.main-vpc.id
}

resource "google_compute_subnetwork" "production_subnet" {
  name          = var.production_subnet_name
  ip_cidr_range = var.production_subnet_cidr
  region        = var.region
  network       = google_compute_network.main-vpc.id
}

resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = google_compute_network.main-vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
