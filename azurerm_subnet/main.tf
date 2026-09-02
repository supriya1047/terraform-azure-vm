resource "azurerm_subnet" "snets" {
    for_each = var.mysubnet
    name = each.value.s_name
    resource_group_name = each.value.S_rg_name
    virtual_network_name = each.value.S_vnet_name
    address_prefixes = each.value.s_aprefix
  
}