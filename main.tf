provider "google" {
  version = "3.5.0"

  credentials = file("../Documents/My TERRA Project 9323-dfb7cadc4e50.json")

  project = "my-terra-project-9323"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}