resource "aws_elastic_beanstalk_environment" "this" {
  name                = var.name
  application         = var.elastic_beanstalk_application_name
  description         = var.description
  solution_stack_name = var.solution_stack_name
  tier                = var.tier

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.iam_eb
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = var.service_role
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = var.associate_public_ip_address
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", sort(var.application_subnets))
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = var.loadbalancer_type
  }
  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = var.elb_scheme
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.autoscale_min
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.autoscale_max
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }

  setting {
    name      = "HealthCheckPath"
    namespace = "aws:elasticbeanstalk:environment:process:default"
    value     = var.healthcheck_url
  }
  setting {
    name      = "document_root"
    namespace = "aws:elasticbeanstalk:container:php:phpini"
    value     = var.document_root
  }
  setting {
    name      = "SecurityGroups"
    namespace = "aws:elbv2:loadbalancer"
    value     = join(",", sort(var.loadbalancer_security_groups))
  }
  setting {
    name      = "ManagedSecurityGroup"
    namespace = "aws:elbv2:loadbalancer"
    value     = join(",", sort(var.loadbalancer_security_groups))
  }
  setting {
    name      = "SecurityGroups"
    namespace = "aws:autoscaling:launchconfiguration"
    value     = join(",", sort(var.security_groups))
  }
  setting {
    name      = "StreamLogs"
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    value     = var.enable_stream_logs
  }
  setting {
    name      = "DeleteOnTerminate"
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    value     = var.logs_delete_on_terminate
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "RetentionInDays"
    value     = var.logs_retention_in_days
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = join(",", sort(var.loadbalancer_subnets))
  }
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "ListenerEnabled"
    value     = var.loadbalancer_certificate_arn == "" ? "false" : "true"
  }
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "Protocol"
    value     = "HTTPS"
  }
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLCertificateArns"
    value     = var.loadbalancer_certificate_arn
  }
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLPolicy"
    value     = var.loadbalancer_type == "application" ? var.loadbalancer_ssl_policy : ""
  }

  // ENV VARS

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "APP_DEBUG"
    value     = var.app_debug
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "APP_ENV"
    value     = var.app_env == "" ? var.env : var.app_env
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "APP_KEY"
    value     = var.app_key
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "APP_NAME"
    value     = "e-dash"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "LOG_CHANNEL"
    value     = var.log_channel
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_CONNECTION"
    value     = var.db_connection
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "BROADCAST_DRIVER"
    value     = var.broadcast_driver
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "CACHE_DRIVER"
    value     = var.cache_driver
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "QUEUE_CONNECTION"
    value     = var.queue_connection
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "SESSION_DRIVER"
    value     = var.session_driver
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "SESSION_LIFETIME"
    value     = var.session_lifetime
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_CLIENT"
    value     = var.redis_client
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_PASSWORD"
    value     = var.redis_password
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_MAILER"
    value     = var.mail_mailer
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_HOST"
    value     = var.mail_host
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_PORT"
    value     = var.mail_port
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_USERNAME"
    value     = var.mail_username
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_PASSWORD"
    value     = var.mail_password
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_ENCRYPTION"
    value     = var.mail_encryption
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_FROM_ADDRESS"
    value     = var.mail_from_address
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MAIL_FROM_NAME"
    value     = var.mail_from_name
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_BUCKET"
    value     = "edash-${var.env}-contents"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_DEFAULT_REGION"
    value     = "ap-northeast-1"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_URL"
    value     = var.aws_cloudfront_url
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PUSHER_APP_ID"
    value     = var.pusher_app_id
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PUSHER_APP_KEY"
    value     = var.pusher_app_key
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PUSHER_APP_SECRET"
    value     = var.pusher_app_secret
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PUSHER_APP_CLUSTER"
    value     = var.pusher_app_cluster
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MIX_PUSHER_APP_KEY"
    value     = var.mix_pusher_app_key
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MIX_PUSHER_APP_CLUSTER"
    value     = var.mix_pusher_app_cluster
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "UID"
    value     = 1000
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "GID"
    value     = 1000
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    value     = var.db_host
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_PORT"
    value     = var.db_port
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_DATABASE"
    value     = var.db_database
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_USERNAME"
    value     = var.db_username
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_PASSWORD"
    value     = var.db_password
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_HOST"
    value     = var.redis_host
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_PORT"
    value     = var.redis_port
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "APP_URL"
    value     = var.app_url
  }
}
