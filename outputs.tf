output "name_prefix" {
  value = local.name_prefix
}

output "primary_region" {
  value = data.aws_region.primary.region
}

output "replica_region" {
  value = data.aws_region.replica.region
}
