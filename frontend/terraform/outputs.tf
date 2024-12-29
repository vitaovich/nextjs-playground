output "static_web_app_url" {
  description = "The URL of the Static Web App"
  value       = azurerm_static_site.swa.default_host_name
}

output "resource_group_id" {
  value = azurerm_resource_group.main.id
}