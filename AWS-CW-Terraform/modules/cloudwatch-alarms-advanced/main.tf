resource "aws_cloudwatch_metric_alarm" "advanced_cloudwatch_alarms" {
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

  ## Metric Query for advanced metrics search
  metric_query {
    id          = "e1"
    expression  = var.expression
    label       = var.label
    return_data = "true"
  }

  metric_query {
    id = "m1"

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

  dynamic "metric_query" {
    for_each = var.include_m2 ? [1] : []
    content {
      id = "m2"

      metric {
        metric_name = var.metric_name2 
        namespace   = var.namespace2
        period      = var.period2
        stat        = var.stat2

        dimensions = {
          (var.dimensions_name_2) = var.optional_dimensions ? var.dimensions_value_2 : null
        }
      }
    }
  }

  dynamic "metric_query" {
    for_each = var.include_m3 ? [1] : []
    content {
      id = "m3"

      metric {
        metric_name = var.metric_name3 
        namespace   = var.namespace3 
        period      = var.period3
        stat        = var.stat3

        dimensions = {
          (var.dimensions_name_3) = var.optional_dimensions ? var.dimensions_value_3 : null
        }
      }
    }
  }
}