resource "azurerm_network_interface" "nics" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }

  name                = "nic-vm${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vms" {
  for_each = { for idx, nic in azurerm_network_interface.nics : idx => nic }

  name                  = "lab6-vm${each.key}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [each.value.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  allow_extension_operations = true
  provision_vm_agent         = true

}

resource "azurerm_virtual_machine_extension" "iis_setup_vm0" {

  name                       = "${azurerm_windows_virtual_machine.vms[0].name}-customScriptExtension"
  virtual_machine_id         = azurerm_windows_virtual_machine.vms[0].id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.10"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
 {
  "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -name Web-Server -IncludeManagementTools; if (Test-Path 'C:\\inetpub\\wwwroot\\iisstart.htm') { Remove-Item 'C:\\inetpub\\wwwroot\\iisstart.htm' -Force }; Add-Content -Path 'C:\\inetpub\\wwwroot\\iisstart.htm' -Value $('Hello World from ' + $env:computername)\""
 }
SETTINGS
}

resource "azurerm_virtual_machine_extension" "iis_setup_vm1" {

  name                       = "${azurerm_windows_virtual_machine.vms[1].name}-customScriptExtension"
  virtual_machine_id         = azurerm_windows_virtual_machine.vms[1].id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.10"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
 {
  "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -name Web-Server -IncludeManagementTools; if (Test-Path 'C:\\inetpub\\wwwroot\\iisstart.htm') { Remove-Item 'C:\\inetpub\\wwwroot\\iisstart.htm' -Force }; Add-Content -Path 'C:\\inetpub\\wwwroot\\iisstart.htm' -Value $('Hello World from ' + $env:computername); New-Item -Path 'c:\\inetpub\\wwwroot' -Name 'image' -ItemType 'Directory' -Force; New-Item -Path 'c:\\inetpub\\wwwroot\\image\\' -Name 'iisstart.htm' -ItemType 'file' -Force; Add-Content -Path 'C:\\inetpub\\wwwroot\\image\\iisstart.htm' -Value $('Image from: ' + $env:computername)\""
 }
SETTINGS
}

resource "azurerm_virtual_machine_extension" "iis_setup_vm2" {

  name                       = "${azurerm_windows_virtual_machine.vms[2].name}-customScriptExtension"
  virtual_machine_id         = azurerm_windows_virtual_machine.vms[2].id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.10"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
 {
  "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -name Web-Server -IncludeManagementTools; if (Test-Path 'C:\\inetpub\\wwwroot\\iisstart.htm') { Remove-Item 'C:\\inetpub\\wwwroot\\iisstart.htm' -Force }; Add-Content -Path 'C:\\inetpub\\wwwroot\\iisstart.htm' -Value $('Hello World from ' + $env:computername); New-Item -Path 'c:\\inetpub\\wwwroot' -Name 'video' -ItemType 'Directory' -Force; New-Item -Path 'c:\\inetpub\\wwwroot\\video\\' -Name 'iisstart.htm' -ItemType 'file' -Force; Add-Content -Path 'C:\\inetpub\\wwwroot\\video\\iisstart.htm' -Value $('Video from: ' + $env:computername)\""
 }
SETTINGS
}
