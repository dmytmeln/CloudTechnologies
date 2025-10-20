output "vms" {
  value = [for name, nic in azurerm_network_interface.nics : {
    name       = name
    id         = azurerm_windows_virtual_machine.vms[name].id
    private_ip = nic.ip_configuration[0].private_ip_address
  }]
}

output "nics" {
  value = [
    for n in azurerm_network_interface.nics : {
      id         = n.id,
      name       = n.name
      private_ip = n.ip_configuration[0].private_ip_address
    }
  ]
}
