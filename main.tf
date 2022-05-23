resource "azurerm_mssql_server" "azuresqldbsrv" {
  name                          = "${lower(var.project)}${lower(var.stage)}dbsrv${var.suffix}"
  location                      = var.location
  resource_group_name           = var.resource_group
  version                       = var.sqlserver_version
  administrator_login           = "${lower(var.project)}${lower(var.stage)}admusr${var.suffix}"
  administrator_login_password  = var.administrator_login_password
  public_network_access_enabled = var.public_access
  minimum_tls_version           = "1.2"
}

resource "azurerm_mssql_database" "azuresqldb" {
  name                             = "${lower(var.project)}${lower(var.stage)}db${var.suffix}"
  server_id                        = azurerm_mssql_server.azuresqldbsrv.id
  location                         = var.location
  resource_group_name              = var.resource_group
  server_name                      = azurerm_mssql_server.azuresqldbsrv.name
  edition                          = var.edition
  requested_service_objective_name = var.performance_class
}

resource "azurerm_mssql_firewall_rule" "azure-sql-enable-access-firewall" {
  name                = "${lower(var.project)}${lower(var.stage)}dbsrvaccessfromazure${var.suffix}"
  server_id           = azurerm_mssql_server.azuresqldbsrv.id
  resource_group_name = var.resource_group
  server_name         = azurerm_mssql_server.azuresqldbsrv.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_storage_account" "azuresql-audit-storage-account" {
  count = var.enable_audit ? 1 : 0

  name                     = "${lower(var.project)}${lower(var.stage)}storaccdbaudit${var.suffix}"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "2.0"
      retention_policy_days = 14
    }
  }
}

resource "azurerm_mssql_database_extended_auditing_policy" "azuresql-audit-policy" {
  count = var.enable_audit ? 1 : 0

  database_id                             = azurerm_mssql_database.azuresqldb.id
  storage_endpoint                        = azurerm_storage_account.azuresql-audit-storage-account[0].primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.azuresql-audit-storage-account[0].primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 90
}