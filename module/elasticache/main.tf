resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  az_mode              = var.az_mode
  security_group_ids   = var.security_group_ids
  subnet_group_name    = var.subnet_group_name

  snapshot_retention_limit = var.snapshot_retention_limit
}
