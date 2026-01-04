variable "network_self_link" {
  description = "Self-link of the VPC network where firewall rules will be applied."
  type        = string
}

variable "ssh_rule_name" {
  description = "Name of the firewall rule allowing SSH access via Google IAP."
  type        = string
}

variable "ssh_source_ranges" {
  description = <<EOT
List of source CIDR ranges allowed to access SSH (TCP 22).
This should contain the Google IAP TCP forwarding IP range(s),
e.g.: ["35.235.240.0/20"].
EOT
  type        = list(string)
}

variable "ssh_target_tags" {
  description = "Network tags identifying VM instances that should allow SSH access via IAP."
  type        = list(string)
}

variable "internal_rule_name" {
  description = "Name of the firewall rule allowing internal VPC communication."
  type        = string
}

variable "internal_source_ranges" {
  description = <<EOT
CIDR ranges allowed for internal east-west communication within the VPC.
Typically this is the VPC CIDR range, e.g. ["10.0.0.0/16"].
EOT
  type        = list(string)
}
