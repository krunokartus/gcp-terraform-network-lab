
terraform {
  backend "gcs" {
    bucket = "cloud-backup-tf-state"
    prefix = "gcp-terraform-network-lab"
  }

  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
