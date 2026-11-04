variable "resource_groups" {
  description = "Resource groups to create, keyed by logical name."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "storage_accounts" {
  description = "Storage accounts to create, keyed by logical name."
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}
