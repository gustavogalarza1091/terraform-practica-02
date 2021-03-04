# Create NIC
resource "azurerm_network_interface" "myNic" {
  name                = "nic-${var.vms[count.index]}"  
  count				  = length(var.vms)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                           = "ipconf-${var.vms[count.index]}"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.${count.index + 10}"
    public_ip_address_id           = azurerm_public_ip.myPublicIp[count.index].id
  }

  tags = {
      environment = "CP2"
  }
}

# IP pública
resource "azurerm_public_ip" "myPublicIp" {
  name                = "vmip-${var.vms[count.index]}"
  count				  = length(var.vms)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
      environment = "CP2"
  }
}