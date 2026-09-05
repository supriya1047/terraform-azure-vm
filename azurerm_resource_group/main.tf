resource "azurerm_resource_group" "rgs" {
    for_each = var.myrg
    name = each.value.name
    location = each.value.location
  
}
# Managed using Terraform
# Testing Git diff
# Change made in feature branch
# Resource group managed through feature branch
# Change from conflict demo branch
# Change from main branch
# Main branch change for rebase demo
# Rebase demo - feature change
# Revert demo change