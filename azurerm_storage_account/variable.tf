variable "storage_work" {
  description = "Storage accounts to create, keyed by a stable logical name."
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}
