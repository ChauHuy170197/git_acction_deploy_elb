resource "aws_security_group_rule" "this" {
  count             = length(var.port)
  security_group_id = var.security_group_id
  type              = "ingress"
  cidr_blocks       = var.cidr_blocks      #tfsec:ignore:AWS006
  ipv6_cidr_blocks  = var.ipv6_cidr_blocks #tfsec:ignore:AWS006
  description       = var.description

  from_port = var.port[count.index]
  to_port   = var.port[count.index]
  protocol  = var.protocol
}
