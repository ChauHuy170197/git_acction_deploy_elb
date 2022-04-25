resource "aws_elastic_beanstalk_application" "this" {
  name        = var.name
  description = var.description
}
