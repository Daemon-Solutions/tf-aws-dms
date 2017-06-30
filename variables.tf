// Global Configuration
variable "envname" {}
variable "envtype" {}
variable "service" {}
variable "enabled" {
  default = true
}

/* // DNS Variables */
/* variable "target_endpoint_dns" { */
/*   default = "0" */
/* } */

/* variable "route53_zone_id" { */
/*   default = "changeme" */
/* } */

/* variable "domain" { */
/*   default = "example.com" */
/* } */

// Source Endpoint Variables
variable "source_endpoint_id" {}
variable "source_endpoint_name" {}
variable "source_engine_name" {}
variable "source_server_name" {}
variable "source_port" {}
variable "source_username" {}
variable "source_password" {}
variable "source_database_name" {
  default = ""
}
variable "source_certificate_arn" {
  default = ""
}
variable "source_extra_connection_attributes" {
  default = ""
}
variable "source_kms_key_arn" {
  default = ""
}
variable "source_ssl_mode" {
  default = ""
}

// Target Endpoint Variables
variable "target_endpoint_id" {}
variable "target_engine_name" {}
variable "target_password" {}
variable "target_port" {}
variable "target_server_name" {}
variable "target_username" {}
variable "target_endpoint_name" {}
variable "target_certificate_arn" {
  default = ""
}
variable "target_database_name" {
  default = ""
}
variable "target_extra_connection_attributes" {
  default = ""
}
variable "target_kms_key_arn" {
  default = ""
}
variable "target_ssl_mode" {
  default = ""
}

// Replication subnet variables
variable "replication_subnet_group_description" {}
variable "replication_subnet_group_id" {}
variable "replication_subnet_subnet_ids" {
  type = "list"
}

// Replication instance variables
variable "replication_instance_class" {}
variable "replication_instance_id" {}
variable "replication_instance_name" {}

variable "replication_instance_allocated_storage" {
  default = ""
}
variable "replication_instance_apply_immediately" {
  default = ""
}
variable "replication_instance_auto_minor_version_upgrade" {
  default = ""
}
variable "replication_instance_availability_zone" {
  default = ""
}
variable "replication_instance_engine_version" {
  default = ""
}
variable "replication_instance_kms_key_arn" {
  default = ""
}
variable "replication_instance_multi_az" {
  default = ""
}
variable "replication_instance_preferred_maintenance_window" {
  default = "sun:03:45-sun:05:45"
}
variable "replication_instance_publicly_accessible" {
  default = ""
}

// Replication task variables
variable "replication_task_id" {}
variable "replication_task_name" {}
variable "replication_task_migration_type" {}
variable "replication_task_table_mappings" {}
variable "replication_task_settings" {
  default = ""
}
variable "replication_task_cdc_start_time" {
  default = ""
}
