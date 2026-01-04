module "firewall" {
  source = "./modules/firewall"

  network_self_link = module.vpc.network_self_link

  ssh_rule_name = "allow-ssh-iap"
  ssh_source_ranges = [
    "35.235.240.0/20"
  ]
  ssh_target_tags = ["ssh-iap"]

  internal_rule_name = "allow-internal"
  internal_source_ranges = [
    "10.0.0.0/16"
  ]
}
