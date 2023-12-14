resource "aws_sns_topic" "sightline_alarm_topic" {
  name = "sightline-alarm-topic"
  # Optionally, you can add more configurations for the SNS topic
}

resource "aws_cloudwatch_metric_alarm" "sightline-alarm" {
  alarm_name          = "sightline-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "sightline-log-metric"  # Replace with your actual metric name
  namespace           = "sightline"
  period              = 300
  statistic           = "Minimum"
  threshold           = 0  # Adjust as needed

  alarm_actions = [
    aws_sns_topic.sightline_alarm_topic.arn,
  ]
}
