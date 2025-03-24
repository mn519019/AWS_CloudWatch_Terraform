# Instance Identifier 
data "aws_instance" "ec2" {
  count = var.instance_exists ? 1 : 0
  filter {
    name = "tag:Name"
    values = [var.dimensions_value]
  }

  filter {
    name = "instance-state-name"
    values = ["running"]
  }
}

# RDS Instance Identifier
data "aws_db_instance" "rds" {
  count = var.database_exists ? 1 : 0
  db_instance_identifier = var.dimensions_value
}

# Step Function Identifier
data "aws_sfn_state_machine" "state" {
  count = var.step_function_exists ? 1 : 0
  name = var.dimensions_value
}

# Lambda Function Identifier 
data "aws_lambda_function" "function" {
  count = var.lambda_function_exists ? 1 : 0
  function_name = var.dimensions_value
}

# CloudFront Identifier 
data "aws_cloudfront_distribution" "distribution" {
  count = var.cloudfront_exists ? 1 : 0
  id = var.dimensions_value
}

# LoadBalancer Identifier 
data "aws_lb" "loadbalancer" {
  count = var.loadbalancer_exists ? 1 : 0  
  name = var.dimensions_value
}

# EFS Identifier
data "aws_efs_file_system" "efs" {
  count = var.efs_exists ? 1 : 0
  file_system_id = var.dimensions_value
}

# SNS Identifier
# data "aws_sns_topic" "sns" {
#   count = var.sns_exists ? 1 : 0
#   name = var.dimensions_value
# }