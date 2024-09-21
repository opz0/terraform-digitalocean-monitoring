output "id" {
  value = digitalocean_tag.id[0].id
}

output "id_check" {
  value       = join("", digitalocean_uptime_check.main[*].id)
  description = " The id of the check."
}



