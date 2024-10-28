output "resource_group_name" {
  value       = azurerm_resource_group.calecture27.name
  description = "The name of the resource group"
}

output "virtual_network_name" {
  value       = azurerm_virtual_network.calecture27.name
  description = "The name of the virtual network"
}

output "subnet_id" {
  value       = azurerm_subnet.calecture27.id
  description = "The ID of the subnet"
}

output "network_interface_id" {
  value       = azurerm_network_interface.calecture27.id
  description = "The ID of the network interface"
}

output "vm_name" {
  value       = azurerm_linux_virtual_machine.calecture27.name
  description = "The name of the Linux virtual machine"
}

output "vm_public_ip" {
  value       = azurerm_network_interface.calecture27.ip_configuration[0].public_ip_address_id
  description = "The public IP address of the Linux virtual machine"
}
