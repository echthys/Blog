provider "azurerm" {

  features {}

  subscription_id = var.subscription_id
}

resource "azurerm_public_ip" "lb_pip" {
  name                = "${var.prefix}-lb-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}


resource "azurerm_lb" "lb" {
  name                = "${var.prefix}-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = azurerm_public_ip.lb_pip.name
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}
