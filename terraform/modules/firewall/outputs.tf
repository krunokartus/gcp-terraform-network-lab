output "ssh_rule_name" {
  description = "Name of the SSH firewall rule (IAP only)"
  value       = google_compute_firewall.allow_ssh_iap.name
}

output "internal_rule_name" {
  description = "Name of the internal firewall rule"
  value       = google_compute_firewall.allow_internal.name
}