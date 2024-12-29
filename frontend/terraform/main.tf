resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "dev"
    team = "frontend"
  }
}

resource "azurerm_static_site" "swa" {
  name                = var.static_web_app_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  tags = {
    environment = "dev"
    team = "frontend"
  }
}
