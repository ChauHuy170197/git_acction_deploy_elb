module "elastic_subnet_group" {
  source     = "../module/elasticache/elastic_subnet_group"
  name       = "redis-subnet-group-Test"
  subnet_ids = [module.private_subnet_01.id, module.private_subnet_02.id]
}

# Create redis instance
module "redis" {
  source          = "../module/elasticache"
  cluster_id      = "Test-redis"
  engine          = "redis"
  node_type       = "cache.t2.micro"
  num_cache_nodes = 1
  # tflint-ignore: all
  parameter_group_name     = "default.redis6.x"
  port                     = 6379
  az_mode                  = "single-az"
  security_group_ids       = [module.security_group_redis_sg.security_group_id]
  subnet_group_name        = module.elastic_subnet_group.id
  snapshot_retention_limit = 7
}