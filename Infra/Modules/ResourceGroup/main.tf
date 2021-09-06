provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}


resource "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
  location = var.location
}
