
//
resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
}

//Virtual Network
resource "azurerm_virtual_network" "vnet_name" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.rg_name
  depends_on = [
    azurerm_resource_group.rg_name
  ]
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefix
  depends_on = [
    azurerm_resource_group.rg_name, 
    azurerm_virtual_network.vnet_name
  ]
  
}
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name


  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = azurerm_subnet.subnet01.id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
  }
}


//Virtual Machine
resource "azurerm_windows_virtual_machine" "myvm_name" {
    name                  = var.vm_name
    resource_group_name   = var.rg_name
    location              = var.location
    size                  = var.vm_size
    admin_username        = var.admin_username
    admin_password        = var.admin_password
    network_interface_ids = [azurerm_network_interface.nic.id]
    depends_on = [
      azurerm_resource_group.rg_name
    ]


    os_disk {
        caching                 = var.vm_caching
        storage_account_type    = var.os_disk_type
    }
    source_image_reference {
        publisher = var.image_publisher
        offer     = var.image_offer
        sku       = var.image_sku
        version   = "latest"
    }
}

//Storage
resource "azurerm_storage_account" "storage_name" {
  name                     = var.storage_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [
    azurerm_resource_group.rg_name
  ]
}
