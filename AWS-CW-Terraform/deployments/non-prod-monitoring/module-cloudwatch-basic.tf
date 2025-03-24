locals {
  basic_tags        = yamldecode(file("./cloudwatch_alarms_config/tags.yaml"))["basic_tags"]
  cloudwatch_alarms = yamldecode(file("./cloudwatch_alarms_config/cloudwatch-alarm-basic.yaml"))["alarms"]
}

module "cloudwatch" {
  source   = "../../modules/cloudwatch-alarms-basic"
  for_each = { for alarm in local.cloudwatch_alarms : alarm.alarm_name => alarm }

  alarm_name                     = each.value.alarm_name
  comparison_operator            = each.value.comparison_operator
  evaluation_periods             = each.value.evaluation_periods
  metric_name                    = each.value.metric_name
  namespace                      = each.value.namespace
  period                         = each.value.period
  stat                           = each.value.stat
  threshold                      = each.value.threshold
  alarm_actions                  = each.value.alarm_actions

  # Only P3 & P4 alarms require this 
  ok_actions                     = lookup(each.value, "ok_actions", [])
  alarm_description              = each.value.alarm_description

  actions_enabled                = each.value.actions_enabled
  treat_missing_data             = each.value.treat_missing_data
  label                          = each.value.label
  dimensions_name                = lookup(each.value, "dimensions_name", "")
  dimensions_value               = lookup(each.value, "dimensions_value", "")

  # Use this input for the specific AWS service 
  instance_exists                = lookup(each.value, "instance_exists", false)
  database_exists                = lookup(each.value, "database_exists", false)
  step_function_exists           = lookup(each.value, "step_function_exists", false)
  lambda_function_exists         = lookup(each.value, "lambda_function_exists", false)
  cloudfront_exists              = lookup(each.value, "cloudfront_exists", false)
  loadbalancer_exists            = lookup(each.value, "loadbalancer_exists", false)
  dimensions_name_2              = lookup(each.value, "dimensions_name_2", "")
  dimensions_value_2             = lookup(each.value, "dimensions_value_2", "")
  optional_dimensions            = lookup(each.value, "optional_dimensions", false)
  efs_exists                     = lookup(each.value, "efs_exists", false)
  custom_dimension_exists        = lookup(each.value, "custom_dimension_exists", false)

  # Basic tags are used
  tags                           = merge(local.basic_tags, each.value.tags)
}

