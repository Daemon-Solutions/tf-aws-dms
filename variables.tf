// Global Configuration
variable "envname" {
  description = "The value for the 'Environment' tag on resources created by this module."
  type = "string"
}

variable "envtype" {
  description = "The value for the 'Envtype' tag on resources created by this module."
  type = "string"
}

variable "service" {
  description = "The value for the 'Service' tag on resources created by this module."
  type = "string"
}

variable "enabled" {
  description = "Bool indicating whether the service is enabled."
  type = "string"
  default = true
}

// Source Endpoint Variables
variable "source_endpoint_id" {
  description = "The source database endpoint identifier."
  type = "string"
}

variable "source_endpoint_name" {
  description = "The value to set in the source database endpoint's 'Name' tag."
  type = "string"
}

variable "source_engine_name" {
  description = "The type of engine for the endpoint."
  type = "string"
}

variable "source_server_name" {
  description = "The host name or IP of the source endpoint database server."
  type = "string"
}

variable "source_port" {
  description = "The port used by the source endpoint database."
  type = "string"
  default = "3306"
}

variable "source_username" {
  description = "The user name to be used to login to the endpoint database."
  type = "string"
}

variable "source_password" {
  description = "The password to be used to login to the endpoint database."
  type = "string"
}

variable "source_database_name" {
  description = "The name of the source endpoint database."
  type = "string"
  default = ""
}

variable "source_certificate_arn" {
  description = "The Amazon Resource Name (ARN) for the TLS certificate."
  type = "string"
  default = ""
}

variable "source_extra_connection_attributes" {
  description = "Additional attributes associated with the connection."
  type = "string"
  default = ""
}

variable "source_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the source connection parameters."
  type = "string"
  default = ""
}

variable "source_ssl_mode" {
  description = "The SSL mode to use for the connection."
  type = "string"
  default = ""
}

// Target Endpoint Variables
variable "target_endpoint_id" {
  description = "The target database endpoint identifier."
  type = "string"
}

variable "target_engine_name" {
  description = "The type of engine for the target endpoint."
  type = "string"
}

variable "target_password" {
  description = "The password to be used to login to the target database."
  type = "string"
}

variable "target_port" {
  description = "The port used by the target endpoint database."
  type = "string"
  default = "3306"
}

variable "target_server_name" {
  description = "The host name or IP of the destination endpoint database server."
  type = "string"
}

variable "target_username" {
  description = "The user name to be used to login to the target database."
  type = "string"
}

variable "target_endpoint_name" {
  description = "The name to set in the target database endpoint's 'Name' tag."
  type = "string"
}

variable "target_certificate_arn" {
  description = "The Amazon Resource Name (ARN) for the target endpoint's certificate."
  type = "string"
  default = ""
}

variable "target_database_name" {
  description = "The name of the target database."
  type = "string"
  default = ""
}

variable "target_extra_connection_attributes" {
  description = "Additional attributes associated with the target connection."
  type = "string"
  default = ""
}

variable "target_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the target connection parameters."
  type = "string"
  default = ""
}

variable "target_ssl_mode" {
  description = "The SSL mode to use for the target connection."
  type = "string"
  default = ""
}

// Replication subnet variables
variable "replication_subnet_group_description" {
  description = "The description for the replication subnet group."
  type = "string"
}

variable "replication_subnet_group_id" {
  description = "The name for the replication subnet group. This value is stored as a lowercase string."
  type = "string"
}

variable "replication_subnet_subnet_ids" {
  description = "A list of the EC2 subnet IDs for the replication subnet group."
  type = "list"
}

// Replication instance variables
variable "replication_instance_class" {
  description = "The instance class to use for the replication instance."
  type = "string"
}

variable "replication_instance_id" {
  description = "The replication instance ID."
  type = "string"
}

variable "replication_instance_name" {
  description = "The name to set in the replication instance's 'Name' tag."
  type = "string"
}

variable "replication_instance_allocated_storage" {
  description = "The amount of storage to allocate to the replication instance (GB)."
  type = "string"
  default = ""
}

variable "replication_instance_apply_immediately" {
  description = "Indicates whether the changes should be applied immediately or during the next maintenance window."
  type = "string"
  default = ""
}

variable "replication_instance_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window."
  type = "string"
  default = ""
}

variable "replication_instance_availability_zone" {
  description = "The EC2 Availability Zone that the replication instance will be created in."
  type = "string"
  default = ""
}

variable "replication_instance_engine_version" {
  description = "The engine version number of the replication instance."
  type = "string"
  default = ""
}

variable "replication_instance_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters."
  type = "string"
  default = ""
}

variable "replication_instance_multi_az" {
  description = "Specifies if the replication instance is a multi-az deployment."
  type = "string"
  default = ""
}

variable "replication_instance_preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC)."
  type = "string"
  default = "sun:03:45-sun:05:45"
}

variable "replication_instance_publicly_accessible" {
  description = "Specifies the accessibility options for the replication instance."
  type = "string"
  default = ""
}

// Replication task variables
variable "replication_task_id" {
  description = ""
  type = "string"
}

variable "replication_task_name" {
  description = "The value to set in the replication task's 'Name' tag."
  type = "string"
}

variable "replication_task_migration_type" {
  description = "The migration task type."
  type = "string"
}

variable "replication_task_table_mappings" {
  description = "An escaped JSON string that contains the table mappings."
  type = "string"
}

variable "replication_task_settings" {
  description = "An escaped JSON string that contains the task settings."
  type = "string"
  default = ""
}

variable "replication_task_cdc_start_time" {
  description = "The Unix timestamp integer for the start of the Change Data Capture (CDC) operation."
  type = "string"
  default = ""
}
