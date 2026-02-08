output "bootstrap_ip" {
  value = azurerm_network_interface.bootstrap[0].private_ip_address
}

output "master_ips" {
  value = azurerm_network_interface.master[*].private_ip_address
}

output "worker_ips" {
  value = azurerm_network_interface.worker[*].private_ip_address
}

output "internal_lb_ip" {
  value = azurerm_lb.internal_api.frontend_ip_configuration[0].private_ip_address
}

output "nsg_id" {
  value = azurerm_network_security_group.cluster_nsg.id
}
