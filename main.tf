resource "azurerm_sql_server" "azuresqldbsrv" {
  name                         = "${lower(var.project)}${lower(var.stage)}dbsrv${var.suffix}"
  location                     = var.location
  resource_group_name          = var.resource_group
  version                      = var.sqlserver_version
  administrator_login          = "${lower(var.project)}${lower(var.stage)}admusr${var.suffix}"
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_sql_database" "azuresqldb" {
  name                             = "${lower(var.project)}${lower(var.stage)}db${var.suffix}"
  location                         = var.location
  resource_group_name              = var.resource_group
  server_name                      = azurerm_sql_server.azuresqldbsrv.name
  edition                          = var.edition
  requested_service_objective_name = var.performance_class
}

resource "azurerm_sql_firewall_rule" "azure-sql-enable-access-firewall" {
  name                = "${lower(var.project)}${lower(var.stage)}dbsrvaccessfromazure${var.suffix}"
  resource_group_name = var.resource_group
  server_name         = azurerm_sql_server.azuresqldbsrv.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}