resource "aws_cloudwatch_log_metric_filter" "metrics" {
  name           = "sightline"
  pattern        = "Status: 401"
  log_group_name = aws_cloudwatch_log_group.sightline.name

  metric_transformation {
    name      = "sightline-log-metric"
    namespace = "sightline"
    value     = "1"
  }
}
resource "aws_cloudwatch_log_metric_filter" "metrics2" {
  name           = "sightline2"
  pattern        = "Status: 401"
  log_group_name = aws_cloudwatch_log_group.sightline.name

  metric_transformation {
    name      = "sightline-log-metric2"
    namespace = "sightline2"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_group" "sightline" {
  name = "sightline"
}