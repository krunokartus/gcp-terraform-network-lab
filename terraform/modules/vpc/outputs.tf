output "network_self_link" {
  value = google_compute_network.main-vpc.self_link
}

output "network_name" {
  value = google_compute_network.main-vpc.name
}

output "management_subnet_self_link" {
  value = google_compute_subnetwork.management_subnet.self_link
}

output "production_subnet_self_link" {
  value = google_compute_subnetwork.production_subnet.self_link
}
