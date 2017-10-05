tf-aws-dms
-----

Data Migration Service (DMS) module.

Creates a DMS source and target endpoints, a DMS replication instance and a DMS replication subnet.

Usage
-----

```js
module "dms" {
  source = "../modules/tf-aws-dms"

  // general options
  enabled = true
  envname = "myenv"
  envtype = "nonprod"
  service = "datamigration"

  // replication source endpoint options
  source_endpoint_id = "dms-source-endpoint-id"
  source_endpoint_name = "dms-source-endpoint-name"
  source_engine_name = "dms-source-engine-name"
  source_server_name = "xxx.xxx.xxx.xxx"
  source_port = "3306"
  source_username = "db-user"
  source_password = "db-pass"
  source_database_name = "source-db-name"
  source_certificate_arn = "source-arn-of-certificate"
  source_extra_connection_attributes = "" // (Optional)
  source_kms_key_arn = "source-arn-of-kms-key" // (Optional)
  source_ssl_mode = "none" // (Optional, Default: none)

  // replication target endpoint options
  target_endpoint_id = "dms-target-endpoint-id"
  target_endpoint_name = "dms-target-endpoint-name"
  target_engine_name = "dms-target-engine-name"
  target_server_name = "xxx.xxx.xxx.xxx"
  target_port = "3306"
  target_username = "db-user"
  target_password = "db-pass"
  target_certificate_arn = "target-arn-of-certificate" // (Optional, Default: empty string)
  target_database_name = "target-db-name" // (Optional)
  target_extra_connection_attributes = "" // (Optional) 
  target_kms_key_arn = "target-arn-of-kms-key" // (Optional)
  target_ssl_mode = "none" // (Optional, Default: none)

  // replication subnet group options
  replication_subnet_group_description = "The replication subnet group"
  replication_subnet_group_id = "dms-replication-subnet-group"
  replication_subnet_subnet_ids = ["subnet-12345678", "subnet-23456781"]

  // replication instance options
  replication_instance_class = "dms.t2.micro"
  replication_instance_id = "dms-replication-instance"
  replication_instance_name = "dms-replication-instance"
  replication_instance_allocated_storage = 20
  replication_instance_apply_immediately = true
  replication_instance_auto_minor_version_upgrade = true
  replication_instance_availability_zone = "eu-west-1a"
  replication_instance_engine_version = "1.9.0"
  replication_instance_kms_key_arn = "arn-of-instance-kms-key"
  replication_instance_multi_az = false
  replication_instance_preferred_maintenance_window = "sun:03:45-sun:05:45"
  replication_instance_publicly_accessible = false

  // replication task options
  replication_task_id = "dms-replication-task"
  replication_task_name = "dms-replication-task"
  replication_task_migration_type = "full-load-and-cdc"
  replication_task_table_mappings = ""
  replication_task_settings = "..."
  replication_task_cdc_start_time = 1484346880
}
```

Variables
---------
_Variables marked with **[*]** are mandatory._

###### General variables
 - `enabled` - Bool indicating whether the service is enabled. [Default: `true`]
 - `envname` - The value for the `Environment` tag on resources created by this module. **[*]**
 - `envtype` - The value for the `Envtype` tag on resources created by this module. **[*]**
 - `service` - The value for the `Service` tag on resources created by this module. **[*]**
 
###### Replication source endpoint options
 - `source_endpoint_id` - The source database endpoint identifier. **[*]**
 - `source_endpoint_name` - The name to set in the source database endpoint's `Name` tag. **[*]**
 - `source_engine_name` - The type of engine for the source endpoint. Can be one of the following options: `mysql` | `oracle` | `postgres` | `mariadb` | `aurora` | `redshift` | `sybase` | `sqlserver`. **[*]**
 - `source_server_name` - The host name or IP of the source endpoint database server. **[*]**
 - `source_port` - The port used by the source endpoint database. [Default: `3306`]
 - `source_username` - The user name to be used to login to the source endpoint database. **[*]**
 - `source_password` - The password to be used to login to the source endpoint database. **[*]**
 - `source_database_name` - The name of the source endpoint database. [Default: _blank_]
 - `source_certificate_arn` - The Amazon Resource Name (ARN) for the TLS certificate on the source endpoint. [Default: _blank_]
 - `source_extra_connection_attributes` - Additional attributes associated with the source connection. For available attributes see the [AWS User Docs](http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ConnectionAttributes.html). [Default: _blank_]
 - `source_kms_key_arn` - The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the source connection parameters. If you do not specify a value for `source_kms_key_arn`, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region. [Default: _blank_]
 - `source_ssl_mode` - The SSL mode to use for the source connection. Can be one of the following options: `none` | `require` | `verify-ca` | `verify-full`. [Default: _blank_]
 
###### Replication target endpoint options
 - `target_endpoint_id` - The target database endpoint identifier. **[*]**
 - `target_endpoint_name` - The value to set in the target database endpoint's `Name` tag. **[*]**
 - `target_engine_name` - = The type of engine for the target endpoint. Can be one of the following options: `mysql` | `oracle` | `postgres` | `mariadb` | `aurora` | `redshift` | `sybase` | `sqlserver`. **[*]**
 - `target_server_name` - The host name or IP of the target  database endpoint server. **[*]**
 - `target_port` - The port used by the target database endpoint. [Default `3306`]
 - `target_username` - The user name to be used to login to the target database. **[*]**
 - `target_password` - The password to be used to login to the target database. **[*]**
 - `target_certificate_arn` - The Amazon Resource Name (ARN) for the target endpoint's certificate. [Default: _blank_]
 - `target_database_name` - The name of the target database. [Default: _blank_]
 - `target_extra_connection_attributes` - Additional attributes associated with the target connection. For available attributes see the [AWS User Docs](http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ConnectionAttributes.html). [Default: _blank_]
 - `target_kms_key_arn` - The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for `target_kms_key_arn`, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region. [Default: _blank_]
 - `target_ssl_mode` - The SSL mode to use for the target connection. Can be one of the following options: `none` | `require` | `verify-ca` | `verify-full`. [Default: _blank_]

###### Replication subnet group options
 - `replication_subnet_group_description` - The description for the replication subnet group. **[*]**
 - `replication_subnet_group_id` - The name for the replication subnet group. This value is stored as a lowercase string. **[*]**
 - `replication_subnet_subnet_ids` - A list of the EC2 subnet IDs for the replication subnet group. **[*]**
 
###### Replication instance options
 - `replication_instance_class` - The instance class to use for the replication instance. For more information on the instance types available please see the [AWS User Docs](http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ReplicationInstance.html). **[*]**
 - `replication_instance_id` - The replication instance ID. For more information on this variable please see the [Terraform User Docs](https://www.terraform.io/docs/providers/aws/r/dms_replication_instance.html#replication_instance_id). **[*]**
 - `replication_instance_name` - The value to set in the replication instance's `Name` tag. **[*]**
 - `replication_instance_allocated_storage` - The amount of storage to allocate to the replication instance. [Default: _blank_]
 - `replication_instance_apply_immediately` - Indicates whether changes to the replication instance should be applied immediately or during the next maintenance window. [Default: _blank_]
 - `replication_instance_auto_minor_version_upgrade` - Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window. [Default: _blank_]
 - `replication_instance_availability_zone` - The EC2 Availability Zone that the replication instance will be created in. [Default: _blank_]
 - `replication_instance_engine_version` - The engine version number of the replication instance. [Default: _blank_] ## CHECK
 - `replication_instance_kms_key_arn` - The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the replication connection parameters. If you do not specify a value for `replication_instance_kms_key_arn`, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region. [Default: _blank_]
 - `replication_instance_multi_az` - Specifies if the replication instance is a multi-az deployment. You cannot set the `availability_zone` variable if the `multi_az` variable is set to `true`. [Default: _blank_]
 - `replication_instance_preferred_maintenance_window` - The weekly time range during which repliation instance system maintenance can occur, in Universal Coordinated Time (UTC). [Default: `sun:03:45-sun:05:45`]
 - `replication_instance_publicly_accessible` - Specifies the accessibility options for the replication instance. A value of `true` represents an instance with a public IP address. A value of `false` represents an instance with a private IP address. [Default: _blank_]
 
###### Replication task options
 - `replication_task_id` - The replication task identifier. For further information on this variable please see the [Terraform User Docs](https://www.terraform.io/docs/providers/aws/r/dms_replication_task.html#replication_task_id). **[*]**
 - `replication_task_name` - The value to set in the replication task's `Name` tag. **[*]**
 - `replication_task_migration_type` - The migration type, select from one of the following options: `full-load` | `cdc` | `full-load-and-cdc`. **[*]**
 - `replication_task_table_mappings` - An escaped JSON string that contains the table mappings. For information on table mapping see the [AWS User Docs](http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html). **[*]**
 - `replication_task_settings` - An escaped JSON string that contains the task settings. For a complete list of task settings, see the [AWS User Docs](http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html). [Default: _blank_]
 - `replication_task_cdc_start_time` - The Unix timestamp integer for the start of the Change Data Capture (CDC) operation. [Default: _blank_]
 
<br />

Outputs
-------
###### Replication instance outputs
 - `replication_instance_arn` - The Amazon Resource Number (ARN) for the replication instance.
 - `replication_instance_private_ips` - A list of the private IP addresses for the replication instance.
 - `replication_instance_public_ips` - A list of the public IP addresses for the replication instance.

###### Endpoint outputs
 - `endpoint_arn` - The Amazon Resource Number (ARN) for the replication endpoint.

###### Subnet outputs
 - `subnet_vpc_id` - The ID for the Virtual Private Cloud (VPC) that resources created by this module reside in.