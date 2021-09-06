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
  description = "Name of the resource group that will be created"
}


variable "location" {
    type = string
    description = "Location that you want the resource to be deployed in."
}