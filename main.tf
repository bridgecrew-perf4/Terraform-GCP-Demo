// Configure the Google Cloud provider
provider "google" {
  credentials = file("credentials.json")
  project     = "my-project-89796-terraform"
  region      = "us-central1-a"
}
//Creating firewall rules
resource "google_compute_firewall" "default" {
  name    = "demo-web"
  network = google_compute_network.default.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  // Allow from any/any
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "default" {
  name = "demo-network"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "ubuntu-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  tags = ["http-server"]

  // Installing nginx
  metadata_startup_script = "sudo apt-get -y update; sudo apt-get install -y dist-upgrade; sudo apt-get -y install nginx"

  network_interface {
    network = "demo-network"
    access_config {
      // Include this section to give the VM an external ip address
    }

  }

}

// A variable for extracting the external IP address of the instance
output "ip" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

