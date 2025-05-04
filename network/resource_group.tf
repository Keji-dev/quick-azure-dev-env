resource "azurerm_resource_group" "mtc-rg" {
  name     = "mtc-resources"
  location = "East US"

  tags = {
    env = "dev"
  }
}