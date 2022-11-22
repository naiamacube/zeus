output "flow-captain-id" {
  value = google_container_cluster.main.id
  sensitive = true
}

output "flow-captain-endpoint" {
  value = google_container_cluster.main.endpoint
  sensitive = true
}

output "flow-captain-master-version" {
  value = google_container_cluster.main.master_version
  sensitive = true
}

output "flow-captain-node-pool-id" {
  value = google_container_node_pool.main.id
  sensitive = true
}
