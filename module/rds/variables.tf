variable "identifier" {
  description = "Name of the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of allocated storage"
  type        = number
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not"
  type        = string
  default     = "gp2"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group"
  type        = string
}

variable "db_name" {
  type    = string
  default = ""
}

variable "db_username" {
  type    = string
  default = ""
}

variable "db_password" {
  type    = string
  default = "" #tfsec:ignore:GEN001
}

variable "db_port" {
  type    = string
  default = ""
}


variable "skip_final_snapshot" {
  type    = bool
  default = true
}


variable "final_snapshot_identifier" {
  type    = string
  default = null
}

variable "enabled_cloudwatch_logs_exports" {
  type    = list(string)
  default = []
}

variable "parameter_group_name" {
  description = "(Optional) Name of the DB parameter group to associate."
  type        = string
}

variable "backup_retention_period" {
  description = "(Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica"
  type        = number
}

variable "storage_encrypted" {
  description = "(Optional) Specifies whether the DB instance is encrypted."
  type        = bool
}
