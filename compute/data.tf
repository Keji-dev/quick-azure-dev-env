data "azurerm_public_ip" "mtc-ip-data" {
  name = azurerm_public_ip.mtc-ip.name
  resource_group_name = azurerm_resource_group.mtc-rg.name
}