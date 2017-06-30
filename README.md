tf-aws-dms
==================

Data migration service module.

# Description
Creates a DMS Endpoint, DMS replication instance and DMS replication
subnet.

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
  source_endpoint_id = ""
  source_endpoint_name = ""
  source_server_name = ""
  source_port = ""
  source_username = ""
  source_password = ""
  source_database_name = ""
  source_certificate_arn = ""
  source_extra_connection_attributes = ""
  source_kms_key_arn = ""
  source_ssl_mode = ""

  // replication target endpoint options
  target_endpoint_id = ""
  target_engine_name = ""
  target_password = ""
  target_port = ""
  target_server_name = ""
  target_username = ""
  target_endpoint_name = ""
  target_certificate_arn = ""
  target_database_name = ""
  target_extra_connection_attributes = ""
  target_kms_key_arn = ""
  target_ssl_mode = ""

  // replication subnet group options
  replication_subnet_group_description = ""
  replication_subnet_group_id = ""
  replication_subnet_subnet_ids = ""

  // replication instance options
  replication_instance_class = ""
  replication_instance_id = ""
  replication_instance_name = ""
  replication_instance_allocated_storage = ""
  replication_instance_apply_immediately = ""
  replication_instance_auto_minor_version_upgrade = ""
  replication_instance_availability_zone = ""
  replication_instance_engine_version = ""
  replication_instance_kms_key_arn = ""
  replication_instance_multi_az = ""
  replication_instance_preferred_maintenance_window = ""
  replication_instance_publicly_accessible = ""

  // replication task options
  replication_task_id = ""
  replication_task_name = ""
  replication_task_migration_type = ""
  replication_task_table_mappings = ""
  replication_task_settings = ""
  replication_task_cdc_start_time = ""
}
```
