module "vpc" {
  source = "../modules/vpc/azure"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name     = "ci-vnet"
  address_space = ["10.0.0.0/16"]
  subnet_name   = "ci-subnet"
  subnet_cidr   = ["10.0.1.0/24"]
}
