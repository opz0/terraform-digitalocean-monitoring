module "labels" {
  source      = "cypik/labels/digitalocean"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}



resource "digitalocean_uptime_check" "main" {
  count   = var.enable ? length(var.target_url) : 0
  name    = var.name
  target  = element(var.target_url, count.index)
  type    = element(var.type, count.index)
  regions = var.regions
  enabled = var.enabled
}



resource "digitalocean_uptime_alert" "main" {
  count      = var.enable ? length(var.target_url) : 0
  name       = var.name
  check_id   = element(concat(digitalocean_uptime_check.main[*].id, [""]), count.index)
  type       = element(var.alert_type, count.index)
  threshold  = element(var.threshold, count.index)
  comparison = element(var.comparison, count.index)
  period     = element(var.period, count.index)

  dynamic "notifications" {
    for_each = try(jsondecode(var.notifications), var.notifications)
    content {
      email = lookup(notifications.value, "email", null)
      dynamic "slack" {
        for_each = lookup(notifications.value, "slack", [])
        content {
          channel = lookup(slack.value, "channel", null)
          url     = lookup(slack.value, "url", null)
        }
      }
    }
  }
}