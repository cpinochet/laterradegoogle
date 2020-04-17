provider "google" {
  version = "3.5.0"

  credentials = file("../Documents/My TERRA Project 9323-dfb7cadc4e50.json")

  project = "my-terra-project-9323"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "default" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terra-insta"
  machine_type = "n1-standard-1"
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = google_compute_network.default.name
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}

resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
}
