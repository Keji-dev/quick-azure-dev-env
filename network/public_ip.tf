resource "azurerm_public_ip" "mtc-ip" {
  name                = "mtc-ip-1"
  resource_group_name = azurerm_resource_group.mtc-rg.name
  location            = azurerm_resource_group.mtc-rg.location
  allocation_method   = "Static"

  tags = {
    environment = "dev"
  }
}

output "public_ip_address" {
  # value = "${azurerm_linux_virtual_machine.mtc-vm.name}: ${data.azurerm_public_ip.mtc-ip-data.ip_address}"
  value = azurerm_public_ip.mtc-ip.ip_address
}