resource "google_compute_instance" "vm_instance" {
  name         = "linux-plus-lab"
  machine_type = "e2-micro"
  zone         = "europe-west3-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.management_subnet.name
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y nginx htop iproute2
    echo "<h1>Welcome to my Linux and network cloud lab</h1>" > /var/www/html/index.html
  EOT
}