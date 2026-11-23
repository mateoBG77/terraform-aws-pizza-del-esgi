locals {
  name_prefix = "${var.project}-${var.environment}" # pizza-del-esgi-dev / -prod
}

data "aws_region" "primary" {}

data "aws_region" "replica" {
  provider = aws.replica
}
