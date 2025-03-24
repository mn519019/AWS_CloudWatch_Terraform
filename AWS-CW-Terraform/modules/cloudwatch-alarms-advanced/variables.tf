variable "region" {
  description = "region variable"
  type        = string
  default     = "ca-central-1"
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric."
  type        = any
  default     = null
}

variable "alarm_name" {
  description = "The alarm name."
  type        = string
  default     = null
}

variable "comparison_operator" {
  description = "The comparison_operator for alarms."
  type        = string
  default     = null
}

variable "evaluation_periods" {
  description = "The evaluation periods for alarms."
  type        = number
  default     = null
}

variable "threshold" {
  description = "The threshold for alarms."
  type        = number
  default     = null
}

variable "alarm_description" {
  description = "The alarm_description for alarms."
  type        = string
  default     = null
}

variable "actions_enabled" {
  description = "The options for alarms actions_enabled."
  type        = bool
}

variable "alarm_actions" {
  description = "The alarm_actions for alarms."
  type        = set(string)
}

variable "ok_actions" {
  description = "The ok_actions for alarms."
  type        = set(string)
}

variable "treat_missing_data" {
  description = "The way to treat_missing_data for alarms."
  type        = string
  default     = null
}

## Expression Query
variable "expression" {
  description = "The expression with metric1, metric2, or metric3."
  type        = string
  default     = null
}

variable "label" {
  description = "The metric label for alarms."
  type        = string
  default     = null
}

## Metric1
variable "metric_name1" {
  description = "The metric_name1 for alarms."
  type        = string
  default     = null
}

variable "namespace1" {
  description = "The namespace1 for alarms."
  type        = string
  default     = null
}

variable "period1" {
  description = "The period1 to trigger alarms."
  type        = number
  default     = null
}

variable "stat1" {
  description = "The stat1 for alarms."
  type        = string
  default     = null
}

## Metric2
variable "metric_name2" {
  description = "The metric_name2 for alarms."
  type        = string
  default     = null
}

variable "namespace2" {
  description = "The namespace2 for alarms."
  type        = string
  default     = null
}

variable "period2" {
  description = "The period2 to trigger alarms."
  type        = number
  default     = null
}

variable "stat2" {
  description = "The stat2 for alarms."
  type        = string
  default     = null
}

variable "include_m2" {
  description = "Whether to include the m2 metric query"
  type        = bool
  default     = false
}

## Metric3
variable "metric_name3" {
  description = "The metric_name3 for alarms."
  type        = string
  default     = null
}

variable "namespace3" {
  description = "The namespace3 for alarms."
  type        = string
  default     = null
}

variable "period3" {
  description = "The period3 to trigger alarms."
  type        = number
  default     = null
}

variable "stat3" {
  description = "The stat3 for alarms."
  type        = string
  default     = null
}

variable "include_m3" {
  description = "Whether to include the m3 metric query"
  type        = bool
  default     = false
}

## tags
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

########## Optional dimension if it's needed ######################
variable "dimensions_name_1" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "Region"
}

variable "dimensions_value_1" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "ca-central-1"
}

########## Optional dimension if it's needed ######################
variable "dimensions_name_2" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "Region"
}

variable "dimensions_value_2" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "ca-central-1"
}

########## Optional dimension if it's needed ######################
variable "dimensions_name_3" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "Region"
}

variable "dimensions_value_3" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "ca-central-1"
}

variable "optional_dimensions" {
  description = "Indicates if optional_dimensions should be included"
  type        = bool
  default     = false
}