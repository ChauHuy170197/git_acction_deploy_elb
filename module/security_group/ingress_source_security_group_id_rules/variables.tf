variable "security_group_id" {
  description = "ID of Security Group"
  default     = ""
}

variable "source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = string
  default     = ""
}

variable "type" {
  description = "The type of Ingress rules"
  type        = string
  default     = ""
}

variable "description" {
  description = "Description of security group ingress rules"
  type        = string
  default     = ""
}

variable "from_port" {
  description = "Number of source port"
  type        = number
  default     = 3306
}

variable "to_port" {
  description = "Number of destination port"
  type        = number
  default     = 3306
}

variable "protocol" {
  description = "Protocol connection"
  type        = string
  default     = "tcp"
}