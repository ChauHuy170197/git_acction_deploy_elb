module "eb_ec2_role" {
  source = "../module/iam/role"
  name   = "aws-elasticbeanstalk-ec2-role-Test"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

module "eb_ec2_role_attachment" {
  source = "../module/iam/role/role_policy_attachment"
  role   = module.eb_ec2_role.role_name
  policy_attachments = [
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
  ]
}

module "instance_profile" {
  source = "../module/iam/role/instance_profile"
  role   = module.eb_ec2_role.role_name
  name   = "aws-elasticbeanstalk-ec2-role-Test"
}

module "eb_service_role" {
  source = "../module/iam/role"
  name   = "aws-elasticbeanstalk-service-role-Test"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "elasticbeanstalk.amazonaws.com"
        }
      },
    ]
  })
}

module "eb_service_role_attachment" {
  source = "../module/iam/role/role_policy_attachment"
  role   = module.eb_service_role.role_name
  policy_attachments = [
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth",
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService",
  ]
}

module "bastion_ec2_role" {
  source = "../module/iam/role"
  name   = "bastion-ec2-role-Test"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

module "bastion_role_attachment" {
  source = "../module/iam/role/role_policy_attachment"
  role   = module.bastion_ec2_role.role_name
  policy_attachments = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  ]
}

module "bastion_instance_profile" {
  source = "../module/iam/role/instance_profile"
  role   = module.bastion_ec2_role.role_name
  name   = "bastion-ec2-role-Test"
}