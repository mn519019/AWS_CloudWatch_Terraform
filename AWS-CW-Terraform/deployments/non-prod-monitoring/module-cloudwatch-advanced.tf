locals {
  advanced_tags              = yamldecode(file("./cloudwatch_alarms_config/tags.yaml"))["advanced_tags"]
  advanced_cloudwatch_alarms = yamldecode(file("./cloudwatch_alarms_config/cloudwatch-alarm-advanced.yaml"))["alarms"]
}

module "cloudwatch_advanced" {
  source   = "../../modules/cloudwatch-alarms-advanced"
  for_each = { for alarm in local.advanced_cloudwatch_alarms : alarm.alarm_name => alarm }

  alarm_name                     = each.value.alarm_name
  comparison_operator            = each.value.comparison_operator
  evaluation_periods             = each.value.evaluation_periods
  threshold                      = each.value.threshold
  alarm_actions                  = each.value.alarm_actions

  # Only P3 & P4 alarms require this 
  ok_actions                     = lookup(each.value, "ok_actions", [])
  alarm_description              = each.value.alarm_description
  actions_enabled                = each.value.actions_enabled
  treat_missing_data             = each.value.treat_missing_data

  # metric query
  expression                     = each.value.expression
  label                          = each.value.label

  optional_dimensions            = lookup(each.value, "optional_dimensions", false)
  # metric1 (Required)
  metric_name1                   = each.value.metric_name1
  namespace1                     = each.value.namespace1
  period1                        = each.value.period1
  stat1                          = each.value.stat1
  dimensions_name_1               = lookup(each.value, "dimension_name1", "")
  dimensions_value_1              = lookup(each.value, "dimension_value1", "")

  # metric 2 (Required)
  include_m2                     = lookup(each.value, "include_m2", false)
  metric_name2                   = lookup(each.value, "metric_name2", null)
  namespace2                     = lookup(each.value, "namespace2", null)
  period2                        = lookup(each.value, "period2", null)
  stat2                          = lookup(each.value, "stat2", null)
  dimensions_name_2               = lookup(each.value, "dimension_name2", "")
  dimensions_value_2              = lookup(each.value, "dimension_value2", "")


  # metric 3 (Optional)
  include_m3                     = lookup(each.value, "include_m3", false)
  metric_name3                   = lookup(each.value, "metric_name3", null)
  namespace3                     = lookup(each.value, "namespace3", null)
  period3                        = lookup(each.value, "period3", null)
  stat3                          = lookup(each.value, "stat3", null)
  dimensions_name_3               = lookup(each.value, "dimension_name3", "")
  dimensions_value_3              = lookup(each.value, "dimension_value3", "")

  # Advanced tags are used
  tags                           = merge(local.advanced_tags, each.value.tags)
}