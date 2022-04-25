variable "name" {
  description = "The name of the DB parameter group. If omitted, Terraform will assign a random, unique name."
  type        = string
}
variable "family" {
  description = "(Required, Forces new resource) The family of the DB parameter group."
  type        = string
}
variable "description" {
  description = "(Optional, Forces new resource) The description of the DB parameter group. Defaults to 'Managed by Terraform'"
  type        = string
}
variable "slow_query_log" {
  type = number
}
variable "long_query_time" {
  type = number
}
variable "log_output" {
  type = string
}
variable "event_scheduler" {
  type = string
}
