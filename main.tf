data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name = var.vnet
  resource_group_name  = var.resource_group
}


resource "azurerm_postgresql_flexible_server" "main" {
  name                   = var.name
  resource_group_name    = var.resource_group
  location               = var.location
  administrator_login    = var.admin_user
  administrator_password = var.admin_pass
  backup_retention_days  = var.backup_retention_days

  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  public_network_access_enabled  = var.public_network_access_enabled

  delegated_subnet_id    = data.azurerm_subnet.subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.main.id


  sku_name               = var.sku_name
  zone                   = var.zone
  version                = var.postgres_version

  storage_mb             = var.storage_mb
  storage_tier           = var.storage_tier

  tags                   = var.tags

  depends_on = [azurerm_private_dns_zone_virtual_network_link.main]
}