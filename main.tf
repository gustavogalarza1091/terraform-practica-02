terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# crea un service principal y rellena los siguientes datos para autenticar
#provider "azurerm" {
#  features {}
#  subscription_id = "<SUBSCRIPCION ID>"
#  client_id       = "<APP_ID>"
#  client_secret   = "<PASSWORD_ID>"
#  tenant_id       = "<TENANT>"
#}

# Sobre este grupo de recursos se creara la maquina virtual
resource "azurerm_resource_group" "rg" {
    name     =  "kubernetes_rg"
    location = var.location

    tags = {
        environment = "CP2"
    }
}

# Se crea la cuenta para el almacenamiento
resource "azurerm_storage_account" "stAccount" {
    name                     = "staccountcp3" 
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CP2"
    }

}