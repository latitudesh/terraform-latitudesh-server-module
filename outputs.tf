output "server" {
  value = latitudesh_server.this
}

output "server_id" {
  value = latitudesh_server.this.id
}

output "server_ipv4" {
  value = latitudesh_server.this.primary_ipv4
}

output "server_ipv6" {
  value = latitudesh_server.this.primary_ipv6
}