resource "aws_cloudwatch_metric_alarm" "advanced_cloudwatch_alarms" {
  alarm_name           = var.alarm_name
  comparison_operator  = var.comparison_operator
  evaluation_periods   = var.evaluation_periods
  threshold            = var.threshold
  threshold_metric_id  = var.threshold_metric_id 
  alarm_description    = var.alarm_description
  actions_enabled      = var.actions_enabled
  # set the alarm action if "action_enable set to true"
  alarm_actions        = var.alarm_actions
  ok_actions           = var.ok_actions 
  treat_missing_data   = var.treat_missing_data
  tags                 = var.tags

  ## Metric Query for advanced metrics search
  metric_query {
    id          = var.expression_id
    expression  = var.expression
    label       = var.label
    return_data = "true"
  }

  metric_query {
    id = "m1"
    return_data = "true"

    metric {
      metric_name = var.metric_name1
      namespace   = var.namespace1
      period      = var.period1
      stat        = var.stat1

      dimensions = {
        (var.dimensions_name_1) =  var.optional_dimensions ? var.dimensions_value_1 : null
      }
    }
  }
}