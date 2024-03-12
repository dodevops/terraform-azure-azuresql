variable "location" {
  type        = string
  description = "Azure location to use"
}

variable "resource_group" {
  type        = string
  description = "Azure Resource Group to use"
}

variable "project" {
  type        = string
  description = "Three letter project key"
}

variable "stage" {
  type        = string
  description = "Stage for this ip"
}

variable "sku_name" {
  type        = string
  description = "Which SKU to use - see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database#sku_name"
}

variable "sqlserver_version" {
  type        = string
  description = "SQL server version to use"
  default     = "12.0"
}

variable "administrator_login_password" {
  type        = string
  description = "Password for the SQL server administrator login"
}

variable "suffix" {
  type        = string
  description = "suffix for special databases"
  default     = ""
}

variable "public_access" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = false
}

variable "enable_audit" {
  type        = bool
  description = "Enable audit of database access and usage"
  default     = true
}