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

variable "user" {
  type        = string
  description = "Username for the VM"
}

variable "pass" {
  type        = string
  description = "Password to log onto the VM"
}
