output "server" {
  value       = latitudesh_server.this
  description = "The complete server resource object containing all attributes and computed values."
}

output "server_hostname" {
  value       = latitudesh_server.this.hostname
  description = "The hostname assigned to the server during creation."
}

output "server_id" {
  value       = latitudesh_server.this.id
  description = "The unique identifier assigned to the server."
}

output "server_ipv4" {
  value       = latitudesh_server.this.primary_ipv4
  description = "The primary IPv4 address assigned to the server."
}

output "server_ipv6" {
  value       = latitudesh_server.this.primary_ipv6
  description = "The primary IPv6 address assigned to the server."
}