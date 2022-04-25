data "aws_acm_certificate" "issued" {
  domain   = "*.Test.io"
  statuses = ["ISSUED"]
}

module "elastic_beanstalk_application" {
  source      = "../module/elastic_beanstalk/application"
  name        = "Test-web-app"
  description = "Test web application"
}

module "elastic_beanstalk_environment" {
  source                             = "../module/elastic_beanstalk/environment"
  name                               = "Test-env"
  elastic_beanstalk_application_name = module.elastic_beanstalk_application.application_name
  description                        = "description"
  solution_stack_name                = "64bit Amazon Linux 2 v3.3.12 running PHP 8.0"
  vpc_id                             = module.vpc.vpc_id
  tier                               = "WebServer"
  service_role                       = module.eb_service_role.role_name

  loadbalancer_type            = "application"
  instance_type                = "t2.micro"
  autoscale_min                = 1
  autoscale_max                = 1
  updating_min_in_service      = 0
  updating_max_batch           = 1
  elb_scheme                   = "public"
  application_subnets          = [module.private_subnet_01.id, module.private_subnet_02.id]
  iam_eb                       = module.instance_profile.instance_profile_name
  healthcheck_url              = "/health-check"
  loadbalancer_subnets         = [module.public_subnet_01.id, module.public_subnet_02.id]
  associate_public_ip_address  = false
  loadbalancer_certificate_arn = data.aws_acm_certificate.issued.arn
  loadbalancer_ssl_policy      = "ELBSecurityPolicy-2016-08"

  loadbalancer_security_groups = [module.security_group_eb_sg.security_group_id]
  security_groups              = [module.security_group_eb_ec2_sg.security_group_id]

  document_root            = "/public"
  enable_stream_logs       = true
  logs_delete_on_terminate = true
  logs_retention_in_days   = 7

  env     = var.env
  app_key = var.app_key

  mail_username  = var.mail_username
  mail_password  = var.mail_password
  mail_from_name = "${var.env}"

  pusher_app_id          = var.pusher_app_id
  pusher_app_key         = var.pusher_app_key
  pusher_app_secret      = var.pusher_app_secret
  pusher_app_cluster     = var.pusher_app_cluster
  mix_pusher_app_key     = var.mix_pusher_app_key
  mix_pusher_app_cluster = var.mix_pusher_app_cluster

  db_host     = split(":", module.rds.endpoint)[0]
  db_username = var.db_username
  db_password = var.db_password
  redis_host  = module.redis.address
  app_url     = var.app_url
}
