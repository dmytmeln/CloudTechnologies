output "resource_group" {
  description = "Resource group details"
  value = {
    name = module.resource_group.name
    id   = module.resource_group.id
  }
}

output "virtual_network" {
  description = "Virtual network details"
  value = {
    name = module.network.vnet_name
    id   = module.network.vnet_id
  }
}

output "vms" {
  value = {
    vm_0 = {
      id       = module.vm_0.id
      name     = module.vm_0.name
      location = module.vm_0.location
      size     = module.vm_0.size
      zone     = module.vm_0.zone
      nic      = module.vm_0.network_interface
    }
    vm_1 = {
      id       = module.vm_1.id
      name     = module.vm_1.name
      location = module.vm_1.location
      size     = module.vm_1.size
      zone     = module.vm_1.zone
      nic      = module.vm_1.network_interface
    }
  }
}

output "disks_details" {
  description = "Managed disks details"
  value = {
    id      = module.managed_disks.disk_id
    name    = module.managed_disks.disk_name
    details = module.managed_disks.disk_details
  }
}

output "vmss_network" {
  description = "VMSS virtual network details"
  value = {
    name = module.networking_vmss.vnet_name
    id   = module.networking_vmss.vnet_id
  }
}

output "vmss_nsg" {
  description = "VMSS Network Security Group details"
  value = {
    name = module.vmss_nsg.name
    id   = module.vmss_nsg.id
  }
}

output "vmss_load_balancer" {
  description = "VMSS Load Balancer details"
  value = {
    name              = module.vmss_lb.name
    id                = module.vmss_lb.id
    public_ip_address = module.vmss_lb.public_ip_address
  }
}

output "vmss" {
  description = "Virtual Machine Scale Set details"
  value = {
    name = module.vmss1.name
    id   = module.vmss1.id
  }
}

output "vmss_autoscale_setting" {
  description = "VMSS autoscale setting details"
  value = {
    name = module.vmss1_autoscale.name
    id   = module.vmss1_autoscale.id
  }
}
