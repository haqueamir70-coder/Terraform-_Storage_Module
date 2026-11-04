resource "azurerm_resource_group" "rg_test1" {
  for_each = var.rg_work

  name     = each.value.name
  location = each.value.location
}
