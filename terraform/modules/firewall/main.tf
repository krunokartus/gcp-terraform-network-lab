# SSH access only via Google IAP TCP forwarding
resource "google_compute_firewall" "allow_ssh_iap" {
  name    = var.ssh_rule_name
  network = var.network_self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Google IAP TCP forwarding IP range
  source_ranges = var.ssh_source_ranges

  # Apply SSH rule only to instances with these tags
  target_tags = var.ssh_target_tags
}

# Internal communication allowed within VPC
resource "google_compute_firewall" "allow_internal" {
  name    = var.internal_rule_name
  network = var.network_self_link

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  # CIDR ranges allowed for internal east-west traffic
  source_ranges = var.internal_source_ranges
}
