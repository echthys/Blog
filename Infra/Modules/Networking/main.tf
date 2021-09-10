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

# WEB SERVER
resource "azurerm_subnet" "web_subnet" {
  name                 = "${var.prefix}-web-snet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space[0], 4, 0)]
}

resource "azurerm_network_security_group" "web_subnet_security_group" {
  name                = "${azurerm_subnet.web_subnet.name}-nsg"
  resource_group_name = azurerm_subnet.web_subnet.resource_group_name
  location            = var.location
}

resource "azurerm_subnet_network_security_group_association" "web_network_security_group_association" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_security_group.id
}

#DB SERVER
resource "azurerm_subnet" "db_subnet" {
  name                 = "${var.prefix}-db-snet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space[0], 4, 1)]
}

resource "azurerm_network_security_group" "db_subnet_security_group" {
  name                = "${azurerm_subnet.db_subnet.name}-nsg"
  resource_group_name = azurerm_subnet.db_subnet.resource_group_name
  location            = var.location
}

resource "azurerm_subnet_network_security_group_association" "db_network_security_group_association" {
  subnet_id                 = azurerm_subnet.db_subnet.id
  network_security_group_id = azurerm_network_security_group.db_subnet_security_group.id
}



