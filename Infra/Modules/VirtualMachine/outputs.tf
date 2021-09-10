output "web_server_nic_id" {
  value = azurerm_network_interface.web_vm_nic.id
}

output "web_server_ip_conf" {
  value = azurerm_network_interface.web_vm_nic.ip_configuration[0].name
}


output "db_server_nic_id" {
  value = azurerm_network_interface.db_vm_nic.id
}

output "db_server_ip_conf" {
  value = azurerm_network_interface.db_vm_nic.ip_configuration[0].name
}
