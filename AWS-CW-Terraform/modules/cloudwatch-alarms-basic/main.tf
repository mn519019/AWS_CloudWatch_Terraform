resource "aws_cloudwatch_metric_alarm" "basic_cloudwatch_alarms" {
  alarm_name           = var.alarm_name
  comparison_operator  = var.comparison_operator
  evaluation_periods   = var.evaluation_periods
  threshold            = var.threshold
  alarm_description    = var.alarm_description
  actions_enabled      = var.actions_enabled
  # set the alarm action if "action_enable set to true"
  alarm_actions        = var.alarm_actions
  ok_actions           = var.ok_actions 
  treat_missing_data   = var.treat_missing_data
  tags                 = var.tags
  metric_query {
    id          = "m1"
    return_data = "true"
    label       = var.label
      metric {
        metric_name = var.metric_name
        namespace   = var.namespace
        period      = var.period
        stat        = var.stat
        dimensions  = { 
                        (var.dimensions_name)   = var.instance_exists ? data.aws_instance.ec2[0].id : (var.database_exists ? data.aws_db_instance.rds[0].id : (var.step_function_exists ? data.aws_sfn_state_machine.state[0].arn :(var.lambda_function_exists ? data.aws_lambda_function.function[0].arn : (var.cloudfront_exists ? data.aws_cloudfront_distribution.distribution[0].id : (var.loadbalancer_exists ? data.aws_lb.loadbalancer[0].arn : var.efs_exists ? data.aws_efs_file_system.efs[0].arn : (var.custom_dimension_exists ? var.dimensions_value : "")))))),        
                        (var.dimensions_name_2) =  var.optional_dimensions ? var.dimensions_value_2 : null
                      }
      } 
   }
}