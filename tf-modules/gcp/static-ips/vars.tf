variable "project_name" {
  description = "The GCP project name"
}

variable "region" {
  description = "The region to launch the vpc in."
}

variable "credentials_file_path" {
  description = "A local path to a service account json credentials file."
}

variable "name" {
  description = "The name for the Static IPs."
}

variable "number_of_ips" {
  description = "The number of static IPs to provision"
}

variable "labels" {
  type = map
  description = "Lables for the IP addresses"
}
