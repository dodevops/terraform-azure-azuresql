# Public IP for Azure

## Introduction

This module manages an Azure SQL database including its server and the needed firewall rule

## Usage

Instantiate the module by calling it from Terraform like this:

```hcl
module "azure-basics" {
  source  = "dodevops/azuresql/azure"
  version = "<version>"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- azurerm

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_mssql_database.azuresqldb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) (resource)
- [azurerm_mssql_database_extended_auditing_policy.azuresql-audit-policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database_extended_auditing_policy) (resource)
- [azurerm_mssql_firewall_rule.azure-sql-enable-access-firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) (resource)
- [azurerm_mssql_server.azuresqldbsrv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) (resource)
- [azurerm_storage_account.azuresql-audit-storage-account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) (resource)

## Required Inputs

The following input variables are required:

### administrator\_login\_password

Description: Password for the SQL server administrator login

Type: `string`

### location

Description: Azure location to use

Type: `string`

### performance\_class

Description: Which performance class to use

Type: `string`

### project

Description: Three letter project key

Type: `string`

### resource\_group

Description: Azure Resource Group to use

Type: `string`

### stage

Description: Stage for this ip

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### edition

Description: Edition to use

Type: `string`

Default: `"Standard"`

### enable\_audit

Description: Enable audit of database access and usage

Type: `bool`

Default: `true`

### public\_access

Description: Whether or not public network access is allowed for this server

Type: `bool`

Default: `false`

### sqlserver\_version

Description: SQL server version to use

Type: `string`

Default: `"12.0"`

### suffix

Description: suffix for special databases

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### azuresql\_administrator\_login

Description: n/a

### azuresqldb

Description: n/a

### azuresqldbsrv

Description: n/a
<!-- END_TF_DOCS -->

## Development

Use [terraform-docs](https://terraform-docs.io/) to generate the API documentation by running

    terraform fmt .
    terraform-docs .