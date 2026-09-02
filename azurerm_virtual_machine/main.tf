


resource "azurerm_network_interface" "nics" {
  for_each            = var.myvm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.pip_name
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.datapip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vms" {
    for_each = var.myvm
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name            
  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id]
  vm_size               = each.value.vm_size

  

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = each.value.Storage_disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.value.vm_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}