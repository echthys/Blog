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

# variable "web_vm_size" {
#   type        = string
#   description = "The size of the web server VM."
# }

# variable "db_vm_size" {
#   type        = string
#   description = "The size of the Database Server VM."
# }


