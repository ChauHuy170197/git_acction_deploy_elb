variable "name" {
  description = "Name of db subnet group"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of subnet ids"
  type        = list(string)
}