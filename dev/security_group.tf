module "security_group_eb_sg" {
  source      = "../module/security_group"
  name        = "Test-eb-sg"
  description = "eb security group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Test-eb-sg"
  }
}

module "sg_rule_eb_ingress_all" {
  source            = "../module/security_group/lb_ingress_rule"
  security_group_id = module.security_group_eb_sg.security_group_id
  description       = "Allow all temporary - will be deleted later"
  cidr_blocks       = ["0.0.0.0/0"] #tfsec:ignore:AWS006
  ipv6_cidr_blocks  = ["::/0"]      #tfsec:ignore:AWS006
}

# Create security group eb egress rule
module "security_group_rule_eb_egress" {
  source            = "../module/security_group/egress_rules"
  security_group_id = module.security_group_eb_sg.security_group_id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  description       = "Allow connect to anywhere"
}

module "security_group_eb_ec2_sg" {
  source      = "../module/security_group"
  name        = "Test-eb-ec2-sg"
  description = "eb security group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Test-eb-ec2-sg"
  }
}

# Create security allow IP
module "security_group_rule_eb_ec2_ingress" {
  source                   = "../module/security_group/ingress_source_security_group_id_rules"
  security_group_id        = module.security_group_eb_ec2_sg.security_group_id
  type                     = "ingress"
  source_security_group_id = module.security_group_eb_sg.security_group_id
  description              = "ALB sg"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

# Create security group eb egress rule
module "security_group_rule_eb_ec2_egress" {
  source            = "../module/security_group/egress_rules"
  security_group_id = module.security_group_eb_ec2_sg.security_group_id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow connect to anywhere"
}


# Create security group for rds db
module "security_group_rds_sg" {
  source      = "../module/security_group"
  name        = "Test-rds-sg"
  description = "rds security group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Test-rds-sg"
  }
}

# Create security group rds allow bastion
module "security_group_rule_rds_bastion_ingress" {
  source                   = "../module/security_group/ingress_source_security_group_id_rules"
  security_group_id        = module.security_group_rds_sg.security_group_id
  source_security_group_id = module.security_group_bastion_sg.security_group_id
  type                     = "ingress"
  description              = "Allow bastion connect"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
}

# Create security group rds allow eb ec2
module "security_group_rule_rds_eb_ingress" {
  source                   = "../module/security_group/ingress_source_security_group_id_rules"
  security_group_id        = module.security_group_rds_sg.security_group_id
  source_security_group_id = module.security_group_eb_ec2_sg.security_group_id
  type                     = "ingress"
  description              = "allow eb connect"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
}

# Create security group rds egress rule
module "security_group_rule_rds_egress" {
  source            = "../module/security_group/egress_rules"
  security_group_id = module.security_group_rds_sg.security_group_id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] #tfsec:ignore:AWS007 ignore warning as this open outbound security rule is valid
  description       = "Allow connect to anywhere"
}

# Create security group for elastic cache (redis)
module "security_group_redis_sg" {
  source      = "../module/security_group"
  name        = "Test-redis-sg"
  description = "redis security group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Test-redis-sg"
  }
}

# Create security group redis allow bastion
module "security_group_rule_redis_bastion_ingress" {
  source                   = "../module/security_group/ingress_source_security_group_id_rules"
  security_group_id        = module.security_group_redis_sg.security_group_id
  source_security_group_id = module.security_group_bastion_sg.security_group_id
  type                     = "ingress"
  description              = "Allow bastion connect"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
}

# Create security group redis allow eb ec2
module "security_group_rule_redis_eb_ingress" {
  source                   = "../module/security_group/ingress_source_security_group_id_rules"
  security_group_id        = module.security_group_redis_sg.security_group_id
  source_security_group_id = module.security_group_eb_ec2_sg.security_group_id
  type                     = "ingress"
  description              = "allow eb connect"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
}

# Create security group redis egress rule
module "security_group_rule_redis_egress" {
  source            = "../module/security_group/egress_rules"
  security_group_id = module.security_group_redis_sg.security_group_id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] #tfsec:ignore:AWS007 ignore warning as this open outbound security rule is valid
  description       = "Allow connect to anywhere"
}

# create security group for bastion
module "security_group_bastion_sg" {
  source      = "../module/security_group"
  name        = "Test-bastion-sg"
  description = "bastion security group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Test-bastion-sg"
  }
}

# Create security group bastion egress rule
module "security_group_rule_bastion_egress" {
  source            = "../module/security_group/egress_rules"
  security_group_id = module.security_group_bastion_sg.security_group_id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow connect to anywhere"
}
