variable "subscription_id" {
  type        = string
  description = "The Azure Subscription ID you want the resource to be deployed in"
}

variable "prefix" {
  type        = string
  description = "Prefix used to name the resource"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group that the VNET will be created in."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The size of the VNET."
}

variable "location" {
  type        = string
  description = "Location of resources"
}

