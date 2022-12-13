rg_name = "RG001"
location = "canadacentral"

vnet_name = "vnet_01"
vnet_address_space = [ "10.0.0.0/16" ]
subnet_name = "subnet_01"
subnet_address_prefix = [ "10.0.2.0/24" ]
nic_name = "nic_01"
nic_ip_config_name = "internal"
nic_private_ip_address_allocation = "Dynamic"

vm_name = "myvm001"
vm_size = "Standard_B1ls"
admin_username = ""
admin_password = ""
vm_caching = "ReadWrite"
os_disk_type = "Standard_LRS"
image_publisher = "MicrosoftWindowsServer"
image_offer = "WindowsServer"
image_sku = "2016-Datacenter"

storage_name = "myuniquestr9876"