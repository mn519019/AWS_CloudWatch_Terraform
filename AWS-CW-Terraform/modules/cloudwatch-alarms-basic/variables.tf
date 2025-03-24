variable "region" {
  description = "region variable"
  type        = string
  default     = "ca-central-1"
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

variable "metric_name" {
  description = "The metric_name for alarms."
  type        = string
  default     = null
}

variable "namespace" {
  description = "The namespace for alarms."
  type        = string
  default     = null
}

variable "period" {
  description = "The period to trigger alarms."
  type        = number
  default     = null
}

variable "stat" {
  description = "The stat for alarms."
  type        = string
  default     = null
}

variable "label" {
  description = "The label of the metrics."
  type        = string
  default     = null
}

# Data resource generator if it's set to true
variable "instance_exists" {
  description = "Boolean to determine if the instance exists"
  type        = bool
  default     = false
}

variable "database_exists" {
  description = "Boolean to determine if the database exists"
  type        = bool
  default     = false
}

variable "step_function_exists" {
  description = "Boolean to determine if the step_function exists"
  type        = bool
  default     = false
}

variable "lambda_function_exists" {
  description = "Boolean to determine if the labmda_function exists"
  type        = bool
  default     = false
}

variable "cloudfront_exists" {
  description = "Boolean to determine if the cloudfront_distribution exists"
  type        = bool
  default     = false
}

variable "loadbalancer_exists" {
  description = "Boolean to determine if the loadbalancer exists"
  type        = bool
  default     = false
}

variable "efs_exists" {
  description = "Boolean to determine if the efs exists"
  type        = bool
  default     = false
}

# variable "sns_exists" {
#   description = "Boolean to determine if the sns exists"
#   type        = bool
#   default     = false
# }

variable "custom_dimension_exists" {
  description = "Boolean to determine if the custom dimension exists"
  type        = bool
  default     = false
}

########## Mandotory dimension ##################################
variable "dimensions_name" {
  description = "The dimensions for the alarm's associated metric"
  type        = any
}

variable "dimensions_value" {
  description = "The dimensions for the alarm's associated metric"
  type        = any
  default     = null
}
########## Optional dimension if it's needed ######################
variable "dimensions_name_2" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "AvailabilityZone"
}

variable "dimensions_value_2" {
  description = "The dimensions for the alarm's associated metric"
  type        = string
  default     = "ca-central-1a"
}

variable "optional_dimensions" {
  description = "Indicates if optional_dimensions should be included"
  type        = bool
  default     = false
}
###################### Anomaly Detection ##########################
# variable "include_anomaly_detection" {
#   description = "Whether to include anomaly detection"
#   type        = bool
#   default     = false
# }

# variable "anomaly_detection_threshold" {
#   description = "The threshold for anomaly_detection_threshold"
#   type        = string
#   default     = "ca-central-1a"
# }
# #####################################################################

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}