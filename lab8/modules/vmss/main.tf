resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.vm_size
  instances           = 2
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  zones               = var.zones

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  boot_diagnostics {
    storage_account_uri = null
  }

  network_interface {
    name    = "${var.name}-nic"
    primary = true

    network_security_group_id = var.nsg_id

    ip_configuration {
      name    = "internal"
      primary = true

      subnet_id = var.subnet_id

      load_balancer_backend_address_pool_ids = [var.lb_backend_pool_id]

    }
  }
}
