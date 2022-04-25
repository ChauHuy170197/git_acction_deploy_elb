resource "aws_security_group_rule" "this" {
  security_group_id = var.security_group_id
  type              = "ingress"
  cidr_blocks       = var.cidr_blocks #tfsec:ignore:AWS006
  description       = var.description

  from_port = var.from_port
  to_port   = var.to_port
  protocol  = var.protocol
}
