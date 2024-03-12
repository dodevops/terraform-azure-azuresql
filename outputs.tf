output "azuresql_administrator_login" {
  value = azurerm_mssql_server.azuresqldbsrv.administrator_login
}

output "azuresqldbsrv" {
  value = azurerm_mssql_server.azuresqldbsrv.name
}

output "azuresqldb" {
  value = azurerm_mssql_database.azuresqldb.name
}