# How to
- Terraform version 1.7.5 is used
- You will need to set up a s3 bucket to store s3 bucket
- You may require SNS to trriger email notification Modify the alarm yaml file as needed. 
```
terraform version

# Expected output
1.7.5

cd deployment/non-prod-monitoring
terraform init;
terrafrom plan;
terraform apply; 
```

# Basic Monitoring
- Basic monitoring module is to provision basic alarms. You specify alarm configurations in the yaml file
- This only deals with maximum two dimensions in the alarm(s). 

```
  - alarm_name: <TBD>
    comparison_operator: <TBD>
    evaluation_periods: <TBD>
    metric_name: "NumberOfBackupJobsFailed"
    namespace: "AWS/Backup"
    period: <TBD>
    stat: <TBD>
    threshold: <TBD>
    actions_enabled: true
    alarm_actions: ["arn:aws:sns:ca-central-1:<Account Number>:test-alarm-medium-NONPROD"]
    alarm_description: <TBD>
    treat_missing_data: <TBD>
    label: "[BackupVaultName: ${PROP('Dim.BackupVaultName')}]"
    ### This case covers when two dimensions are required 
    custom_dimension_exists: true                      <--------- For the first dimension
    dimensions_name: "BackupVaultName"                 <--------- Based on your alarm
    dimensions_value: "aws/efs/automatic-backup-vault" <--------- Based on your alarm
    optional_dimensions: true                          <--------- For the second dimension
    dimensions_name_2: "ResourceType"                  <--------- Based on your alarm
    dimensions_value_2: "EFS"                          <--------- Based on your alarm
    tags:
      Severity: "P3"
      Resource: "Backup"
      Service: "EFS"
```

# Advanced  Monitoring
- Advanced monitoring module is to provision alarms that require extra calculations with multiple alarms.
- There are 3 dimensions provided in total. The first dimension is necessary and the other two dimensions are optional. 

```
  - alarm_name: <TBD>
    comparison_operator: "GreaterThanOrEqualToThreshold"
    evaluation_periods: 2
    threshold: 80 # Percentage
    alarm_actions: ["arn:aws:sns:ca-central-1:<Account Number>:nuans-alarms-high-PROD"]
    actions_enabled: true
    treat_missing_data: "breaching"
    alarm_description: <TBD>
    #########################
    ### Metrics Calculation #
    #########################
    expression: "((7851760 - (m1 + m2 + m3)) / 7851760) * 100"
    label: "Database1_Memory_Utilization"
    #########################
    ### First Metrics       #
    #########################
    metric_name1: Memory-Free-Kilobytes-DB1
    namespace1: RDSCustomMetrics
    period1: 300
    stat1: "Average"
    #########################
    ### Second Metrics      #
    #########################
    include_m2: true
    metric_name2: Memory-Buffered-Kilobytes-DB1
    namespace2: RDSCustomMetrics
    period2: 300
    stat2: "Average"
    #########################
    ### Third Metrics       #
    #########################
    include_m3: true
    metric_name3: Memory-Cached-Kilobytes-DB1
    namespace3: RDSCustomMetrics
    period3: 300
    stat3: "Average"
    ########################
    # tags                 #
    ########################
    tags:
      Severity: "P2"
      Resource: "RDS"
```

# Anomaly Detection
- This is to leverage anomaly detection from AWS CloudWatch
- expression_id should be set as ad1 
- expression should be set as ANOMALY_DETECTION_BAND(m1, 10) 

```
## File Name: cloudwatch-alarm-anomaly-detection.yaml 
  - alarm_name: <TBD>
    comparison_operator: "LessThanLowerOrGreaterThanUpperThreshold"
    evaluation_periods: 2
    threshold_metric_id: ad1
    alarm_actions: ["arn:aws:sns:ca-central-1:<Account Number>:nuans-alarms-medium-PROD"]
    ok_actions: ["arn:aws:sns:ca-central-1:<Account Number>:nuans-ok-medium-PROD"]
    actions_enabled: true
    treat_missing_data: "breaching"
    alarm_description: TBD
    expression_id: ad1
    expression: ANOMALY_DETECTION_BAND(m1, 10)
    label: "WriteIOPS-TEST"
    metric_name1: WriteIOPS
    namespace1: AWS/RDS
    period1: 300
    stat1: "Average"
    include_m2: false
    include_m3: false
    tags:
      Severity: "P3"
      Resource: "TEST"
      Service: "RDS
```
