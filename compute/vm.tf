resource "azurerm_linux_virtual_machine" "mtc-vm" {
  name                = "mtc-vm"
  resource_group_name = azurerm_resource_group.mtc-rg.name
  location            = azurerm_resource_group.mtc-rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.mtc-nic.id,
  ]

  custom_data = filebase64("customdata.tpl")

  lifecycle {
    ignore_changes = [custom_data]
  }

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/quick-azure-dev-env/.ssh/mtcazurekey.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # provisioner "local-exec" {
  #   command = templatefile("linux-ssh-script.tpl", {
  #     hostname = self.ip_address
  #     user = "adminuser"
  #     identityFile = "~/quick-azure-dev-env/.ssh/mtcazurekey"
  #     })
  #   interpreter = [ "bash", "-c" ]
  # }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}