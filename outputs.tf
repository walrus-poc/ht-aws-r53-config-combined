output "endpoints" {
  description = "The endpoints, a string map, the key is the name, and the value is the URL."
  value       = try(nonsensitive(local.resource_url), local.resource_url)
}