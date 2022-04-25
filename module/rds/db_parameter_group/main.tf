resource "aws_db_parameter_group" "this" {
  name        = var.name
  family      = var.family
  description = var.description
  parameter {
    apply_method = "immediate"
    name         = "slow_query_log"
    value        = var.slow_query_log
  }
  parameter {
    apply_method = "immediate"
    name         = "long_query_time"
    value        = var.long_query_time
  }
  parameter {
    apply_method = "immediate"
    name         = "log_output"
    value        = var.log_output
  }
  parameter {
    apply_method = "immediate"
    name         = "event_scheduler"
    value        = var.event_scheduler
  }
}
