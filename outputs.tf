output "azuresql_administrator_login" {
  value = azurerm_sql_server.azuresqldbsrv.administrator_login
}

output "azuresqldbsrv" {
  value = azurerm_sql_server.azuresqldbsrv.name
}

output "azuresqldb" {
  value = azurerm_sql_database.azuresqldb.name
}