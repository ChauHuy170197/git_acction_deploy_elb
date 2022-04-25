resource "aws_security_group_rule" "this" {
  security_group_id = var.security_group_id
  type              = "egress"
  cidr_blocks       = var.cidr_blocks      #tfsec:ignore:AWS007 ignore warning as this open outbound security rule is valid
  ipv6_cidr_blocks  = var.ipv6_cidr_blocks #tfsec:ignore:AWS007 ignore warning as this open outbound security rule is valid
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  description       = var.description
}
