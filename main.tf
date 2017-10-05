// Create the source Data Migration Service Endpoint (source database)
resource "aws_dms_endpoint" "source_endpoint" {
  count         = "${var.enabled == "true" ? 1 : 0 }"
  endpoint_id   = "${var.source_endpoint_id}"
  endpoint_type = "source"
  engine_name   = "${var.source_engine_name}"

  server_name   = "${var.source_server_name}"
  port          = "${var.source_port}"
  username      = "${var.source_username}"
  password      = "${var.source_password}"
  database_name = "${var.source_database_name}"

  extra_connection_attributes = "${var.source_extra_connection_attributes}"

  // Security settings
  kms_key_arn     = "${var.source_kms_key_arn}"
  certificate_arn = "${var.source_certificate_arn}"
  ssl_mode        = "${var.source_ssl_mode}"

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
  endpoint_id   = "${var.target_endpoint_id}"
  endpoint_type = "target"
  engine_name   = "${var.target_engine_name}"
  password      = "${var.target_password}"
  port          = "${var.target_port}"
  server_name   = "${var.target_server_name}"
  username      = "${var.target_username}"

  certificate_arn             = "${var.target_certificate_arn}"
  database_name               = "${var.target_database_name}"
  extra_connection_attributes = "${var.target_extra_connection_attributes}"
  kms_key_arn                 = "${var.target_kms_key_arn}"
  ssl_mode                    = "${var.target_ssl_mode}"

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
  replication_subnet_group_description = "${var.replication_subnet_group_description}"
  replication_subnet_group_id          = "${var.replication_subnet_group_id}"

  subnet_ids = ["${var.replication_subnet_subnet_ids}"]
}

// Create a Data Migration Service replication instance
resource "aws_dms_replication_instance" "repinstance" {
  count                      = "${var.enabled == "true" ? 1 : 0 }"
  replication_instance_class = "${var.replication_instance_class}"
  replication_instance_id    = "${var.replication_instance_id}"

  allocated_storage            = "${var.replication_instance_allocated_storage}"
  apply_immediately            = "${var.replication_instance_apply_immediately}"
  availability_zone            = "${var.replication_instance_availability_zone}"
  engine_version               = "${var.replication_instance_engine_version}"
  kms_key_arn                  = "${var.replication_instance_kms_key_arn}"
  multi_az                     = "${var.replication_instance_multi_az}"
  preferred_maintenance_window = "${var.replication_instance_preferred_maintenance_window}"
  publicly_accessible          = "${var.replication_instance_publicly_accessible}"
  replication_instance_name    = "${var.replication_instance_name}"
  replication_subnet_group_id  = "${aws_dms_replication_subnet_group.subnet.id}"

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
  replication_instance_arn = "${aws_dms_replication_instance.test-dms-replication-instance-tf.replication_instance_arn}"
  replication_task_id      = "${var.replication_task_id}"

  migration_type      = "${var.replication_task_migration_type}"
  table_mappings      = "${var.replication_task_table_mappings}"
  source_endpoint_arn = "${aws_dms_endpoint.test-dms-source-endpoint-tf.endpoint_arn}"
  target_endpoint_arn = "${aws_dms_endpoint.test-dms-target-endpoint-tf.endpoint_arn}"

  cdc_start_time            = "${var.replication_task_cdc_start_time}"
  replication_task_settings = "${var.replication_task_settings}"

  tags {
    Name        = "${var.replication_task_name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
    Envtype     = "${var.envtype}"
  }
}
