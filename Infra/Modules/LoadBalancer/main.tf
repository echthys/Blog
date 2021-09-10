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


resource "azurerm_lb_backend_address_pool" "lb-be-pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.prefix}-lb-be-pool"
}

resource "azurerm_lb_rule" "lb-web-ssh-rule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "Web-SSH-Rule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_public_ip.lb_pip.name
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lb-be-pool.id
}


resource "azurerm_network_interface_backend_address_pool_association" "web-to-be-pool" {
  network_interface_id    = var.web_server_nic_id
  ip_configuration_name   = var.web_server_ip_conf
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-be-pool.id
}
