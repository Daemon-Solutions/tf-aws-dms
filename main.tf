// Not tested on any versions below 0.9.0
terraform {
  required_version = ">= 0.9.0"
}

// http://docs.aws.amazon.com/dms/latest/userguide/CHAP_GettingStarted.html
// Create the source Data Migration Service Endpoint (source database)
resource "aws_dms_endpoint" "source_endpoint" {
  count         = "${var.enabled == "true" ? 1 : 0 }"
  endpoint_id   = "${var.source_endpoint_id}"         # (Required) The database endpoint identifier.
  endpoint_type = "source"                            # (Required) The type of endpoint. Can be one of source | target.
  engine_name   = "${var.source_engine_name}"         # (Required) The type of engine for the endpoint. Can be one of mysql | oracle | postgres | mariadb | aurora | redshift | sybase | sqlserver.

  server_name   = "${var.source_server_name}"   # (Required) The host name of the server.
  port          = "${var.source_port}"          # (Required) The port used by the endpoint database.
  username      = "${var.source_username}"      # (Required) The user name to be used to login to the endpoint database.
  password      = "${var.source_password}"      # (Required) The password to be used to login to the endpoint database.
  database_name = "${var.source_database_name}" # (Optional) The name of the endpoint database.

  extra_connection_attributes = "${var.source_extra_connection_attributes}" # extra_connection_attributes - (Optional) Additional attributes associated with the connection. For available attributes see Using Extra Connection Attributes with AWS Database Migration Service (http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ConnectionAttributes.html)

  // security stuff
  kms_key_arn     = "${var.source_kms_key_arn}"     # (Optional) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region.
  certificate_arn = "${var.source_certificate_arn}" # (Optional, Default: empty string) The Amazon Resource Name (ARN) for the certificate.
  ssl_mode        = "${var.source_ssl_mode}"        # (Optional, Default: none) The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full

  tags {
    Name        = "${var.source_endpoint_name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
    Envtype     = "${var.envtype}"
  }
}

// Create the target Data Migration Service Endpoint (target database)
resource "aws_dms_endpoint" "target_endpoint" {
  count         = "${var.enabled == "true" ? 1 : 0 }"
  endpoint_id   = "${var.target_endpoint_id}"         #  (Required) The database endpoint identifier.
  endpoint_type = "target"                            # (Required) The type of endpoint. Can be one of target | target.
  engine_name   = "${var.target_engine_name}"         # (Required) The type of engine for the endpoint. Can be one of mysql | oracle | postgres | mariadb | aurora | redshift | sybase | sqlserver.
  password      = "${var.target_password}"            # (Required) The password to be used to login to the endpoint database.
  port          = "${var.target_port}"                # (Required) The port used by the endpoint database.
  server_name   = "${var.target_server_name}"         # (Required) The host name of the server.
  username      = "${var.target_username}"            # (Required) The user name to be used to login to the endpoint database.

  certificate_arn             = "${var.target_certificate_arn}"             # (Optional, Default: empty string) The Amazon Retarget Name (ARN) for the certificate.
  database_name               = "${var.target_database_name}"               # (Optional) The name of the endpoint database.
  extra_connection_attributes = "${var.target_extra_connection_attributes}" # extra_connection_attributes - (Optional) Additional attributes associated with the connection. For available attributes see Using Extra Connection Attributes with AWS Database Migration Service (http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.ConnectionAttributes.html)
  kms_key_arn                 = "${var.target_kms_key_arn}"                 # (Optional) The Amazon Retarget Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region.
  ssl_mode                    = "${var.target_ssl_mode}"                    # (Optional, Default: none) The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full

  tags {
    Name        = "${var.target_endpoint_name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
    Envtype     = "${var.envtype}"
  }
}

// Create a Data Migration Service Subnet
resource "aws_dms_replication_subnet_group" "subnet" {
  count                                = "${var.enabled == "true" ? 1 : 0 }"
  replication_subnet_group_description = "${var.replication_subnet_group_description}" # (Required) The description for the subnet group.
  replication_subnet_group_id          = "${var.replication_subnet_group_id}"          # (Required) The name for the replication subnet group. This value is stored as a lowercase string.

  subnet_ids = ["${var.subnet_ids}"] # (Required) A list of the EC2 subnet IDs for the subnet group.
}

// Create a Data Migration Service replication instance
resource "aws_dms_replication_instance" "repinstance" {
  count                      = "${var.enabled == "true" ? 1 : 0 }"
  replication_instance_class = "${var.replication_instance_class}" # (Required) The compute and memory capacity of the replication instance as specified by the replication instance class. Can be one of dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge
  replication_instance_id    = "${var.replication_instance_id}"    # (Required) The replication instance identifier. This parameter is stored as a lowercase string.

  allocated_storage            = "${var.replication_instance_allocated_storage}"            # (Optional, Default: 50, Min: 5, Max: 6144) The amount of storage (in gigabytes) to be initially allocated for the replication instance.
  apply_immediately            = "${var.replication_instance_apply_immediately}"            # (Optional, Default: false) Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource.
  auto_minor_version_upgrade   = "${var.replication_instance_auto_minor_version_upgrade}"   # (Optional, Default: false) Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window.
  availability_zone            = "${var.replication_instance_availability_zone}"            # (Optional) The EC2 Availability Zone that the replication instance will be created in.
  engine_version               = "${var.replication_instance_engine_version}"               # (Optional) The engine version number of the replication instance.
  kms_key_arn                  = "${var.replication_instance_kms_key_arn}"                  # (Optional) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region.
  multi_az                     = "${var.replication_instance_multi_az}"                     # (Optional) Specifies if the replication instance is a multi-az deployment. You cannot set the availability_zone parameter if the multi_az parameter is set to true.
  preferred_maintenance_window = "${var.replication_instance_preferred_maintenance_window}" # (Optional) The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).
  publicly_accessible          = "${var.replication_instance_publicly_accessible}"          # (Optional, Default: false) Specifies the accessibility options for the replication instance. A value of true represents an instance with a public IP address. A value of false represents an instance with a private IP address.
  replication_instance_name    = "${var.replication_instance_name}"                         # (Optional) A list of VPC security group IDs to be used with the replication instance. The VPC security groups must work with the VPC containing the replication instance.
  replication_subnet_group_id  = "${aws_dms_replication_subnet_group.subnet}"               # (Optional) A subnet group to associate with the replication instance.

  tags {
    Name        = "${var.replication_instance_name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
    Envtype     = "${var.envtype}"
  }

  vpc_security_group_ids = [
    "sg-12345678",
  ]
}

// Create a replication task to perform the migration
resource "aws_dms_replication_task" "reptask" {
  count                    = "${var.enabled == "true" ? 1 : 0 }"
  replication_instance_arn = "${aws_dms_replication_instance.test-dms-replication-instance-tf.replication_instance_arn}" # (Required) The Amazon Resource Name (ARN) of the replication instance.
  replication_task_id      = "${var.replication_task_id}"                                                                # (Required) The replication task identifier.

  migration_type      = "${var.replication_task_migration_type}"                       # (Required) The migration type. Can be one of full-load | cdc | full-load-and-cdc.
  table_mappings      = "${var.replication_task_table_mappings}"                       # (Required) An escaped JSON string that contains the table mappings. For information on table mapping see Using Table Mapping with an AWS Database Migration Service Task to Select and Filter Data (http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html)
  source_endpoint_arn = "${aws_dms_endpoint.test-dms-source-endpoint-tf.endpoint_arn}" # (Required) The Amazon Resource Name (ARN) string that uniquely identifies the source endpoint.
  target_endpoint_arn = "${aws_dms_endpoint.test-dms-target-endpoint-tf.endpoint_arn}" # (Required) The Amazon Resource Name (ARN) string that uniquely identifies the target endpoint.

  cdc_start_time            = "${var.replication_task_cdc_start_time}" # (Optional) The Unix timestamp integer for the start of the Change Data Capture (CDC) operation.
  replication_task_settings = "${var.replication_task_settings}"       # (Optional) An escaped JSON string that contains the task settings. For a complete list of task settings, see Task Settings for AWS Database Migration Service Tasks (http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html).

  tags {
    Name        = "${var.replication_task_name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
    Envtype     = "${var.envtype}"
  }
}
