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
