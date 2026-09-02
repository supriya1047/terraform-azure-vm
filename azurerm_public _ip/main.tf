resource "azurerm_public_ip" "pips" {
    for_each = var.mypip
  name                = each.value.name
  resource_group_name = each.value.p_rg_name
  location            = each.value.p_location
  allocation_method   = "Static"

  
}