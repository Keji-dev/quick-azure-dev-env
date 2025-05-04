# In process of moduling the proyect

# resource "azurerm_resource_group" "mtc-rg" {
#   name     = "mtc-resources"
#   location = "East US"

#   tags = {
#     env = "dev"
#   }
# }

# module "network" {
#   source              = "./modules/network"
#   location            = azurerm_resource_group.mtc-rg.location
#   resource_group_name = azurerm_resource_group.mtc-rg.name
# }

# module "vm" {
#   source              = "./modules/vm"
#   location            = azurerm_resource_group.mtc-rg.location
#   resource_group_name = azurerm_resource_group.mtc-rg.name
#   subnet_id           = module.network.subnet_id
#   nsg_id              = module.network.nsg_id
#   ssh_key_path        = "~/quick-azure-dev-env/.ssh/mtcazurekey.pub"
# }
