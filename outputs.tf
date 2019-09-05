// replication instance outputs
output "replication_instance_arn" {
  value = "${aws_dms_replication_instance.replication_instance_arn}"
}

output "replication_instance_private_ips" {
  value = "${aws_dms_replication_instance.replication_instance_private_ips}"
}

output "replication_instance_public_ips" {
  value = "${aws_dms_replication_instance.replication_instance_public_ips}"
}

// endpoint outputs
output "endpoint_arn" {
  value = "${aws_dms_replication_instance.replication_instance_public_ips}"
}

output "source_endpoint_arn" {
  value = "${aws_dms_endpoint.source_endpoint.endpoint_arn}"
}

output "target_endpoint_arn" {
  value = "${aws_dms_endpoint.target_endpoint.endpoint_arn}"
}

// subnet ouputs
output "subnet_vpc_id" {
  value = "${aws_dms_replication_subnet_group.subnet}"
}
