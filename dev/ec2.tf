module "key_pair" {
  source     = "../module/key_pair"
  key_name   = "Test-bastion"
  public_key = var.public_key

  tags = {
    Name = "bastion"
  }
}

module "bastion_ec2" {
  source                 = "../module/ec2"
  ami                    = "ami-0fa2f209276d26768"
  instance_type          = "t2.micro"
  key_name               = module.key_pair.id
  subnet_id              = module.private_subnet_01.id
  private_ip             = "10.10.32.100"
  iam_instance_profile   = module.bastion_instance_profile.instance_profile_name
  vpc_security_group_ids = [module.security_group_bastion_sg.security_group_id]

  tags = {
    Name = "Test-bastion"
  }
}
