terraform {
  # backend "s3" {
  # }
  backend "gcs" {}
}

provider "google" {
  region      = var.region
  project     = var.project_name
  credentials = file(var.credentials_file_path)
  version     = "~> v3.9.0"
}

###################################################
# Bastion host
###################################################
resource "google_compute_address" "bastion_ip" {
  name = "${var.vpc_name}-bastion-b-address"
}

resource "google_compute_instance" "bastion" {
  name           = "${var.vpc_name}-bastion-b"
  machine_type   = var.bastion_machine_type
  zone           = var.bastion_region_zone
  can_ip_forward = "true"

  tags = ["bastion"]

  boot_disk {
    initialize_params {
      image = var.bastion_image
      size  = "10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
    network_ip = var.bastion_internal_ip

    access_config {
      nat_ip = google_compute_address.bastion_ip.address
    }
  }
}

resource "google_compute_firewall" "allow_bastion_traffic" {
  name    = "${var.vpc_name}-allow-internal-services-bastion"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.internal_services_bastion_cidr]
}

resource "google_compute_firewall" "bastion_allow_outbound" {
  name        = "${var.vpc_name}-allow-outbound-through-bastion"
  network     = google_compute_network.main.name
  target_tags = ["bastion"]

  allow {
    protocol = "all"
  }

  source_ranges = [google_compute_subnetwork.private_subnet.ip_cidr_range]
}

resource "google_compute_route" "outbound_through_bastion" {
  name                   = "${var.vpc_name}-outbound-through-bastion"
  dest_range             = "0.0.0.0/0"
  network                = google_compute_network.main.name
  priority               = "1000"
  next_hop_instance      = google_compute_instance.bastion.name
  next_hop_instance_zone = google_compute_instance.bastion.zone
  tags                   = ["private-subnet"]
}

