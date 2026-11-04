module "resource_groups" {
  source  = "./azurerm_resource_group"
  rg_work = var.resource_groups
}

module "storage_accounts" {
  source       = "./azurerm_storage_account"
  storage_work = var.storage_accounts

  depends_on = [module.resource_groups]
}
