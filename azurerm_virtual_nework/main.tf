resource "azurerm_virtual_network" "vnets" {
  for_each            = var.myvnet
  name                = each.value.v_name
  location            = each.value.v_location
  resource_group_name = each.value.v_rg_name
  address_space       = each.value.v_aspace
}