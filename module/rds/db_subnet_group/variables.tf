variable "name" {
  description = "Name of db subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet ids"
  type        = list(string)
}