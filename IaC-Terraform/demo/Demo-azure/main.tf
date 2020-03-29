# Configure the Microsoft Azure Provider.
provider "azurerm" {
  version = "~>1.44.0"
  
  subscription_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  client_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  client_secret = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  tenant_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

# Configure a backend to maintain state.
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}

# Create a resource group
resource "azurerm_resource_group" "arg" {
  name     = "rg-demo-learning"
  location = "eastus"
}

# Create App Service plan
resource "azurerm_app_service_plan" "asp" {
  name                = "asp-demo-learning"
  location            = azurerm_resource_group.arg.location
  resource_group_name = azurerm_resource_group.arg.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

# Create WebApp
resource "azurerm_app_service" "as" {
  name                = "app-service-demo-learning"
  location            = azurerm_resource_group.arg.location
  resource_group_name = azurerm_resource_group.arg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
}

# Create storage
resource "azurerm_storage_account" "asa" {
  name                     = "asa-demo-learning"
  resource_group_name      = azurerm_resource_group.arg.name
  location                 = azurerm_resource_group.arg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}