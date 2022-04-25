resource "aws_db_instance" "this" {
  identifier = var.identifier

  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  publicly_accessible  = var.publicly_accessible
  engine_version       = var.engine_version
  engine               = var.engine
  instance_class       = var.instance_class
  storage_encrypted    = var.storage_encrypted
  db_subnet_group_name = var.db_subnet_group_name
  parameter_group_name = var.parameter_group_name

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password #tfsec:ignore:GEN003
  port     = var.db_port

  vpc_security_group_ids = var.vpc_security_group_ids

  # Database Deletion Protection
  deletion_protection = false

  # Snapshot name upon DB deletion
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  backup_retention_period         = var.backup_retention_period
}
