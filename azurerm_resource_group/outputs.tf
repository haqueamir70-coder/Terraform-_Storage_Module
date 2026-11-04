output "ids" {
  description = "Resource group IDs keyed by logical name."
  value       = { for key, group in azurerm_resource_group.rg_test1 : key => group.id }
}

output "names" {
  description = "Resource group names keyed by logical name."
  value       = { for key, group in azurerm_resource_group.rg_test1 : key => group.name }
}
