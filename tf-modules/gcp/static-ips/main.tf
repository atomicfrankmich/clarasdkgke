terraform {
  backend "gcs" {}
}

provider "google-beta" {
  region      = var.region
  project     = var.project_name
  credentials = file(var.credentials_file_path)
  version     = "~> v3.10.0"
}

resource "google_compute_address" "address" {
  provider               = google-beta
  count  = var.number_of_ips
  name   = "${var.name}-external-address-${count.index}"
  region = var.region
  labels = var.labels
}
