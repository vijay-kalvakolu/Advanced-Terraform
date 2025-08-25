output "instance-connect" {
  value = google_compute_instance.obs.network_interface[0].network_ip
}
