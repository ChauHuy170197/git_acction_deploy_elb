# Create parameter group
module "parameter_group" {
  source          = "../module/rds/db_parameter_group"
  name            = "test-mysql"
  description     = "Custom parameter group of mysql 8 - Test environment"
  family          = "mysql8.0"
  log_output      = "FILE"
  long_query_time = 1
  slow_query_log  = 1
  event_scheduler = "ON"
}

# Create db subnet group
module "db_subnet_group" {
  source     = "../module/rds/db_subnet_group"
  name       = "test-subnet-group"
  subnet_ids = [module.private_subnet_01.id, module.private_subnet_02.id]
}

# Create RDS database
module "rds" {
  source = "../module/rds"

  identifier           = "test-rds"
  allocated_storage    = 20
  db_subnet_group_name = module.db_subnet_group.id
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  publicly_accessible  = false
  parameter_group_name = module.parameter_group.name

  vpc_security_group_ids = [module.security_group_rds_sg.security_group_id]

  db_name     = "Huydb"
  db_username = var.db_username
  db_password = var.db_password
  db_port     = "3306"

  skip_final_snapshot       = true
  final_snapshot_identifier = "Test-sn"
  backup_retention_period   = 7
  storage_encrypted         = true
}