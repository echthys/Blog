provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# WEB Server

resource "azurerm_network_interface" "web_vm_nic" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.prefix}-config"
    subnet_id                     = var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "web_vm" {
  name                  = "${var.prefix}-web-vm-01"
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.web_vm_nic.id]
  vm_size               = "Standard_B1ls"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-web-vm-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-web-vm-01"
    admin_username = var.user
    admin_password = var.pass
  }

  delete_os_disk_on_termination = true

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
