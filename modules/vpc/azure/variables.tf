variable "resource_group_name" { description = "Resource group name"; type = string }
variable "location" { description = "Azure region"; type = string }
variable "vnet_name" { description = "Virtual Network name"; type = string }
variable "address_space" { description = "VNet address space"; type = list(string) }
variable "subnet_name" { description = "Subnet name"; type = string }
variable "subnet_cidr" { description = "Subnet CIDR range"; type = list(string) }
