// Global Configuration
variable "envname" {}

variable "envtype" {}
variable "service" {}

// DNS Variables
variable "target_endpoint_dns" {
  default = "0"
}

variable "route53_zone_id" {
  default = "changeme"
}

variable "domain" {
  default = "example.com"
}

// Source Endpoint Variables
variable "source_endpoint_id" {}

variable "source_port" {}
variable "source_server_name" {}
variable "source_username" {}
variable "source_certificate_arn" {}
variable "source_database_name" {}
variable "source_extra_connection_attributes" {}
variable "source_kms_key_arn" {}
variable "source_ssl_mode" {}
variable "source_endpoint_name" {}

// Target Endpoint Variables
variable "target_endpoint_id" {}

variable "target_engine_name" {}
variable "target_password" {}
variable "target_port" {}
variable "target_server_name" {}
variable "target_username" {}
variable "target_certificate_arn" {}
variable "target_database_name" {}
variable "target_extra_connection_attributes" {}
variable "target_kms_key_arn" {}
variable "target_ssl_mode" {}
variable "target_endpoint_name" {}

// Replication subnet variables
variable "replication_subnet_group_description" {}

variable "replication_subnet_group_id" {}

// Replication instance variables
variable "replication_instance_allocated_storage" {}

variable "replication_instance_apply_immediately" {}
variable "replication_instance_auto_minor_version_upgrade" {}
variable "replication_instance_availability_zone" {}
variable "replication_instance_engine_version" {}
variable "replication_instance_kms_key_arn" {}
variable "replication_instance_multi_az" {}
variable "replication_instance_preferred_maintenance_window" {}
variable "replication_instance_publicly_accessible" {}
variable "replication_instance_name" {}

// Replication task variables
