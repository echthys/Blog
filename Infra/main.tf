terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.75.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "blog_tfstate"
    storage_account_name = "blogtfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {

  }
  subscription_id = var.subscription_id
}

module "blog_resource_group" {
  source              = "./Modules/ResourceGroup"
  subscription_id     = var.subscription_id
  prefix              = var.prefix
  resource_group_name = "${var.prefix}-rg"
  location            = var.location
}

module "blog_vnet" {
  source              = "./Modules/Networking"
  subscription_id     = var.subscription_id
  prefix              = var.prefix
  resource_group_name = module.blog_resource_group.resource_group_name
  location            = var.location
  vnet_address_space  = ["172.16.0.0/24"]
}

