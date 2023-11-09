output "id" {
  value       = join("", digitalocean_uptime_alert.main[*].id)
  description = "The name of the monitoring."
}

output "id_check" {
  value       = join("", digitalocean_uptime_check.main[*].id)
  description = " The id of the check."
}



