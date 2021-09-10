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
  my_ip               = data.http.my_ip.body
}

module "blog_lb" {
  source              = "./Modules/LoadBalancer"
  subscription_id     = var.subscription_id
  prefix              = var.prefix
  resource_group_name = module.blog_resource_group.resource_group_name
  location            = var.location
  web_server_nic_id   = module.virtual_machines.web_server_nic_id
  web_server_ip_conf  = module.virtual_machines.web_server_ip_conf
}

module "virtual_machines" {
  source              = "./Modules/VirtualMachine"
  subscription_id     = var.subscription_id
  prefix              = var.prefix
  resource_group_name = module.blog_resource_group.resource_group_name
  location            = var.location
  web_subnet_id       = module.blog_vnet.web_subnet_id
  db_subnet_id        = module.blog_vnet.db_subnet_id
  user                = var.user
  pass                = var.pass
}



