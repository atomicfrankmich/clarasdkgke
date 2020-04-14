output "static_ip_addr" {
  value = google_compute_address.address[*].address
}
