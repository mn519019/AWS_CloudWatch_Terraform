locals {
  anomaly_detection_tags              = yamldecode(file("./cloudwatch_alarms_config/tags.yaml"))["anomaly_detection_tags"]
  anomaly_detection_cloudwatch_alarms = yamldecode(file("./cloudwatch_alarms_config/cloudwatch-alarm-anomaly-detection.yaml"))["alarms"]
}

module "cloudwatch_anomaly_detection" {
  source   = "../../modules/cloudwatch-alarms-anomaly-detection"
  for_each = { for alarm in local.anomaly_detection_cloudwatch_alarms : alarm.alarm_name => alarm }

  alarm_name                     = each.value.alarm_name
  comparison_operator            = each.value.comparison_operator
  evaluation_periods             = each.value.evaluation_periods
  threshold                      = lookup(each.value, "threshold", null)
  threshold_metric_id            = lookup(each.value, "threshold_metric_id", null)
  alarm_actions                  = each.value.alarm_actions

  # Only P3 & P4 alarms require this 
  ok_actions                     = lookup(each.value, "ok_actions", [])
  alarm_description              = each.value.alarm_description
  actions_enabled                = each.value.actions_enabled
  treat_missing_data             = each.value.treat_missing_data

  # metric query
  expression_id                  = lookup(each.value, "expression_id", "e1")
  expression                     = each.value.expression
  label                          = each.value.label

  # metric1 (Required)
  metric_name1                   = each.value.metric_name1
  namespace1                     = each.value.namespace1
  period1                        = each.value.period1
  stat1                          = each.value.stat1
  dimensions_name_1               = lookup(each.value, "dimension_name1", "")
  dimensions_value_1              = lookup(each.value, "dimension_value1", "")
  optional_dimensions            = lookup(each.value, "optional_dimensions", false)

  # Advanced tags are used
  tags                           = merge(local.anomaly_detection_tags, each.value.tags)
}