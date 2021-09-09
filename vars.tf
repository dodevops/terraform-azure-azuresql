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

variable "edition" {
  type        = string
  description = "Edition to use"
  default     = "Standard"
}

variable "performance_class" {
  type        = string
  description = "Which performance class to use"
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