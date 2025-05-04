resource "azurerm_subnet_network_security_group_association" "mtc-nsga" {
  subnet_id                 = azurerm_subnet.mtc-subnet.id
  network_security_group_id = azurerm_network_security_group.mtc-nsg.id
}

resource "azurerm_network_interface_security_group_association" "mtc-nic-nsg" {
  network_interface_id      = azurerm_network_interface.mtc-nic.id
  network_security_group_id = azurerm_network_security_group.mtc-nsg.id
}