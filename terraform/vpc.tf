module "vpc" {
  source = "./modules/vpc"

  project_id = var.project_id
  region     = var.region

  vpc_name = "main-vpc"

  management_subnet_name = "management-subnet"
  management_subnet_cidr = "10.0.1.0/24"

  production_subnet_name = "production-subnet"
  production_subnet_cidr = "10.0.2.0/24"

  router_name = "router"
  nat_name    = "nat"
}
