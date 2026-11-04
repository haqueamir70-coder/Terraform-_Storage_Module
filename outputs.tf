output "resource_group_ids" {
  description = "Resource group IDs keyed by logical name."
  value       = module.resource_groups.ids
}

output "resource_group_names" {
  description = "Resource group names keyed by logical name."
  value       = module.resource_groups.names
}

output "storage_account_ids" {
  description = "Storage account IDs keyed by logical name."
  value       = { for key, account in module.storage_accounts : key => account.id }
}
