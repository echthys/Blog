provider "azurerm" {
  features {

  }
  subscription_id = var.subscription_id
}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  location            = var.location
}

resource "azurerm_subnet" "web_subnet" {
  name                 = "${var.prefix}-web-snet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space[0], 4, 0)]
}

resource "azurerm_subnet" "db_subnet" {
  name                 = "${var.prefix}-db-snet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space[0], 4, 1)]
}
