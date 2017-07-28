// replication instance outputs
output "replication_instance_arn" {
  value = "${aws_dms_replication_instance.repinstance.replication_instance_id}"
}

/* output "replication_instance_private_ips" { */
/*   value = "${aws_dms_replication_instance.replication_instance_private_ips}" */
/* } */

/* output "replication_instance_public_ips" { */
/*   value = "${aws_dms_replication_instance.replication_instance_public_ips}" */
/* } */

output "endpoint_arn" {
  value = "${aws_dms_replication_instance.replication_instance_public_ips}"
}

output "source_endpoint_arn"{
  value = "${aws_dms_endpoint.source_endpoint.endpoint_arn}"
}

output "target_endpoint_arn"{
  value = "${aws_dms_endpoint.source_endpoint.endpoint_arn}"
}
