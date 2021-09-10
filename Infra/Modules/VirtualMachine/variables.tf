variable "subscription_id" {
  type        = string
  description = "The ID of the Azure Subscription you are trying to deploy to."
}

variable "prefix" {
  type        = string
  description = "The Prefix for the naming of the resources."
}

variable "location" {
  type        = string
  description = "Location that resources will be deployed."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group that the VNET will be created in."
}

variable "web_subnet_id" {
  type        = string
  description = "The ID of the Web Subnet"
}

variable "db_subnet_id" {
  type        = string
  description = "The ID of the DB Subnet"
}

variable "user" {
  type        = string
  description = "Username for the VM"
}

variable "pass" {
  type        = string
  description = "Password to log onto the VM"
}
