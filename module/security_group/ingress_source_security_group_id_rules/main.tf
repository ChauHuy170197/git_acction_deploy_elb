resource "aws_security_group_rule" "this" {
  security_group_id        = var.security_group_id
  source_security_group_id = var.source_security_group_id
  type                     = "ingress"
  description              = var.description

  from_port = var.from_port
  to_port   = var.to_port
  protocol  = var.protocol
}