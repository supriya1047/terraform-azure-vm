resource "azurerm_resource_group" "rgs" {
    for_each = var.myrg
    name = each.value.name
    location = each.value.location
  
}
# Managed using Terraform