# WEB NSRs
resource "azurerm_network_security_rule" "web_subnet_http_security_rule" {
  name                        = "http_in"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_subnet.web_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.web_subnet_security_group.name
}

resource "azurerm_network_security_rule" "web_subnet_https_security_rule" {
  name                        = "https_in"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_subnet.web_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.web_subnet_security_group.name
}

resource "azurerm_network_security_rule" "web_subnet_ssh_security_rule" {
  name                        = "ssh_in"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.my_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_subnet.web_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.web_subnet_security_group.name
}

resource "azurerm_network_security_rule" "web_subnet_deny_security_rule" {
  name                        = "deny_all"
  priority                    = "4096"
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_subnet.web_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.web_subnet_security_group.name
}


# DBNSRs


resource "azurerm_network_security_rule" "db_subnet_ssh_security_rule" {
  name                        = "ssh_in"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.my_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_subnet.db_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.db_subnet_security_group.name
}

resource "azurerm_network_security_rule" "db_subnet_mysql_security_rule" {
  name                        = "mysql_in"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = azurerm_subnet.web_subnet.address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_subnet.db_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.db_subnet_security_group.name
}

resource "azurerm_network_security_rule" "db_subnet_deny_security_rule" {
  name                        = "deny_all"
  priority                    = "4096"
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_subnet.db_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.db_subnet_security_group.name
}



