module "compute" {
  source = "./modules/compute"

  instance_name = "mgmt-vm"
  machine_type  = "e2-medium"
  zone          = var.zone
  image         = "debian-cloud/debian-12"

  subnet_self_link = module.vpc.management_subnet_self_link

  network_tags = ["ssh-iap"]
}
