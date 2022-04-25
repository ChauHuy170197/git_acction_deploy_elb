variable "security_group_id" {
  description = "ID of Security Group"
  default     = ""
}

variable "cidr_blocks" {
  description = "The CIDR block for the subnet of Egress rules"
  type        = list(string)
  default     = []
}

variable "ipv6_cidr_blocks" {
  description = "The IPv6 CIDR block for the subnet of Ingress rules"
  type        = list(string)
  default     = []
}

variable "type" {
  description = "The type of Egress rules"
  type        = string
  default     = ""
}

variable "from_port" {
  description = "Number of source port"
  type        = number
  default     = 0
}

variable "to_port" {
  description = "Number of destination port"
  type        = number
  default     = 0
}

variable "protocol" {
  description = "Protocol connection"
  type        = string
  default     = "tcp"
}

variable "description" {
  description = "Description of security group egress rules"
  type        = string
  default     = ""
}
