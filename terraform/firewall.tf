# SSH only via IAP allowed
resource "google_compute_firewall" "allow_ssh_iap" {
  name    = "allow-ssh-iap"
  network = google_compute_network.main_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"] # Google IAP IP range, this range may change, check https://cloud.google.com/iap/docs/using-tcp-forwarding#ip_ranges
}

# Internal communication allowed
resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.main_vpc.name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["10.0.1.0/24", "10.0.2.0/24"]
}