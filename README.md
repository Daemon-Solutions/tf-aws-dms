tf-aws-dms
==================

Data migration service module.

# Description
Creates a DMS source and target endpoints, a DMS replication instance and a DMS replication subnet.

# Usage

```
module "dms" {
  source = "../modules/tf-aws-dms"

  // general options
  enabled = true
  envname = "myenv"
  envtype = "nonprod"
  service = "datamigration"

  // replication source endpoint options
  source_endpoint_id = "dms-source-endpoint-id" // (Required) The source database endpoint identifier.
  source_endpoint_name = "dms-source-endpoint-name" // (Required) The name to set in the source database endpoint's Name tag.
  source_engine_name = "dms-source-engine-name" // (Required) The type of engine for the endpoint. Can be one of mysql | oracle | postgres | mariadb | aurora | redshift | sybase | sqlserver.
  source_server_name = "xxx.xxx.xxx.xxx" // (Required) The host name or IP of the source endpoint database server.
  source_port = "3306" // (Required) The port used by the source endpoint database.
  source_username = "db-user" // (Required) The user name to be used to login to the endpoint database.
  source_password = "db-pass" // (Required) The password to be used to login to the endpoint database.
  source_database_name = "source-db-name"  // (Optional) The name of the source endpoint database.
  source_certificate_arn = "source-arn-of-certificate" // (Optional, Default: empty string) The Amazon Resource Name (ARN) for the certificate.
  source_extra_connection_attributes = "" // (Optional) Additional attributes associated with the connection. For available attributes see http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ConnectionAttributes.html
  source_kms_key_arn = "source-arn-of-kms-key" // (Optional) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region.
  source_ssl_mode = "none" // (Optional, Default: none) The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full

  // replication target endpoint options
  target_endpoint_id = "dms-target-endpoint-id" // (Required) The target database endpoint identifier.
  target_endpoint_name = "dms-target-endpoint-name" // (Required) The name to set in the target database endpoint's Name tag.
  target_engine_name = "dms-target-engine-name" (Required) The type of engine for the endpoint. Can be one of mysql | oracle | postgres | mariadb | aurora | redshift | sybase | sqlserver.
  target_server_name = "xxx.xxx.xxx.xxx" // (Required) The host name or IP of the destination endpoint database server.
  target_port = "3306" // (Required) The port used by the target endpoint database.
  target_username = "db-user" // (Required) The user name to be used to login to the endpoint database.
  target_password = "db-pass" // (Required) The password to be used to login to the endpoint database.
  target_certificate_arn = "target-arn-of-certificate" // (Optional, Default: empty string) The Amazon Resource Name (ARN) for the certificate.
  target_database_name = "target-db-name" // (Optional) The name of the target endpoint database.
  target_extra_connection_attributes = "" // (Optional) Additional attributes associated with the connection. For available attributes see http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ConnectionAttributes.html
  target_kms_key_arn = "target-arn-of-kms-key" // (Optional) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region.
  target_ssl_mode = "none" // (Optional, Default: none) The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full

  // replication subnet group options
  replication_subnet_group_description = "The replication subnet group" // (Required) The description for the subnet group.
  replication_subnet_group_id = "dms-replication-subnet-group" (Required) The name for the replication subnet group. This value is stored as a lowercase string.
  replication_subnet_subnet_ids = [
    "subnet-12345678",
    "subnet-23456781"
  ] // (Required) A list of the EC2 subnet IDs for the subnet group.

  // replication instance options
  replication_instance_class = "dms.t2.micro" // (Required) instance class to use for the replication instance refer to: http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ReplicationInstance.html
  replication_instance_id = "dms-replication-instance" // (Required) Replication instance ID - see https://www.terraform.io/docs/providers/aws/r/dms_replication_instance.html#replication_instance_id
  replication_instance_name = "dms-replication-instance" // (Required) The name to set in the replication instance's Name tag.
  replication_instance_allocated_storage = 20 // (Required) The amount of storage to allocate on the replication instance
  replication_instance_apply_immediately = true // (Optional, Default: false) Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource.
  replication_instance_auto_minor_version_upgrade = true // (Optional, Default: false) Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window.
  replication_instance_availability_zone = "eu-west-1a" // (Optional) The EC2 Availability Zone that the replication instance will be created in.
  replication_instance_engine_version = "1.9.0" // (Optional) The engine version number of the replication instance.
  replication_instance_kms_key_arn = "arn-of-instance-kms-key" // (Optional) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region.
  replication_instance_multi_az = false // (Optional) Specifies if the replication instance is a multi-az deployment. You cannot set the availability_zone parameter if the multi_az parameter is set to true.
  replication_instance_preferred_maintenance_window = "sun:03:45-sun:05:45" // (Optional) The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). (If not specified defaults to: "sun:03:45-sun:05:45")
  replication_instance_publicly_accessible = false // (Optional, Default: false) Specifies the accessibility options for the replication instance. A value of true represents an instance with a public IP address. A value of false represents an instance with a private IP address.

  // replication task options
  replication_task_id = "dms-replication-task" // (Required) The replication task identifier - see documentation at: https://www.terraform.io/docs/providers/aws/r/dms_replication_task.html#replication_task_id
  replication_task_name = "dms-replication-task" // (Required) Name to set in the replication task's Name tag.
  replication_task_migration_type = "full-load-and-cdc" // (Required) Can be one of full-load | cdc | full-load-and-cdc.
  replication_task_table_mappings = "" // (Optional) - see documentation at: https://www.terraform.io/docs/providers/aws/r/dms_replication_task.html#table_mappings
  replication_task_settings = "..." // (Optional) - see documentation at: https://www.terraform.io/docs/providers/aws/r/dms_replication_task.html#replication_task_settings
  replication_task_cdc_start_time = 1484346880 // (Optional) The Unix timestamp integer for the start of the Change Data Capture (CDC) operation.
}
```
