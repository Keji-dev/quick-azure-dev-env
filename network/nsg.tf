resource "azurerm_network_security_group" "mtc-nsg" {
  name                = "mtc-nsg"
  location            = azurerm_resource_group.mtc-rg.location
  resource_group_name = azurerm_resource_group.mtc-rg.name

  tags = {
    env = "dev"
  }
}