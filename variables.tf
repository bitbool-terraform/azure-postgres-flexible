variable "name" {}
variable "resource_group" {}
variable "location" {}
variable "admin_user" {}
variable "admin_pass" {}

variable "vnet" {}
variable "subnet" {}

variable "backup_retention_days" {default = 7 }
variable "geo_redundant_backup_enabled" {default = false }
variable "public_network_access_enabled" {default = false }
variable "private_dns_zone_id" {default = null }

variable "sku_name" {default = "B_Standard_B1ms"}
variable "storage_mb" {default = 32768 }
variable "storage_tier" {default = "P4" }

variable "postgres_version" {default = "16" }
variable "tags" {default = null }
variable "zone" {default = null }

