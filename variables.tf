//Variables for Resource Group
variable "rg_name" {
    type = string
    description = "The name of resource group"
}
variable "location" {
    type = string
    description = "Azure location "
}


// Variables for VNET
variable "vnet_name" {
  type = string
}
variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}
variable "subnet_address_prefix" {
  type = list(string)
}
variable "nic_name" {
    type = string
}
variable "nic_ip_config_name" {
    type = string
}
variable "nic_private_ip_address_allocation" {
    type = string 
}
# variable "subnet_id" {
#     type = string
# }
// Variables for Virtual Machine

variable "vm_name" {
    type = string
    description = "The name of the virtual machine"
}
variable "vm_size" {
    type = string
    description = "size of the virtual machine"
}
variable "admin_username" {
    type = string
    description = "local admin user of the virtual machine"
}
variable "admin_password" {
    type = string
    description = "password of the local admin user"
}
# variable "nic_ids" {
#     type = any
#     description = "network interface id"
# }
variable "vm_caching" {
    type = string  
}
variable "os_disk_type" {
    type = string
    description = "type of the os disk. example Standard_LRS"
}
variable "image_publisher" {
    type = string
    description = "Azure image publisher"
}
variable "image_offer" {
    type = string
    description = "Azure image offer"
}
variable "image_sku" {
    type = string
    description = "Azure image sku"
}
variable "storage_name" {
    type = string
}



