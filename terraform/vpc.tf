# VPC
resource "google_compute_network" "main_vpc" {
  name                    = "industrial-vpc"
  auto_create_subnetworks = false
}

# Management Subnet
resource "google_compute_subnetwork" "management_subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.main_vpc.id
}

# Industrial Subnet
resource "google_compute_subnetwork" "production_subnet" {
  name          = "production-subnet"
  ip_cidr_range = "10.0.2.0/24"
  network       = google_compute_network.main_vpc.id
}

# Cloud Router, needed for Cloud NAT
resource "google_compute_router" "router" {
  name    = "router"
  network = google_compute_network.main_vpc.id
}

# Cloud NAT, private instances can access the internet
resource "google_compute_router_nat" "nat" {
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}