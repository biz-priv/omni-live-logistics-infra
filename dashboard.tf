resource "aws_cloudwatch_dashboard" "sightline" {
  dashboard_name = "sightline-dashboard"

  dashboard_body = jsonencode({
    "widgets": [
        {
            "type": "log",
            "x": 0,
            "y": 0,
            "width": 24,
            "height": 6,
            "properties": {
                "query": "SOURCE 'sightline' | fields @logStream, @message | filter @logStream = 'sightline' | parse @message \"Main: sightline, Method: *, Status: *\" as method, status | filter ispresent(method) and ispresent(status) | stats count() as requests by method, status ",                "region": "us-east-1",
                "stacked": false,
                "view": "pie"
            }
        },
        {
            "type": "log",
            "x": 0,
            "y": 0,
            "width": 24,
            "height": 6,
            "properties": {
                "query": "SOURCE 'sightline' | fields @logStream, @message | filter @logStream = 'sightline' | parse @message \"Main: sightline, Method: *, Status: *\" as method, status | filter ispresent(method) and ispresent(status) | stats count() as requests by method, status ",                "region": "us-east-1",
                "stacked": false,
                "view": "table"
            }
        }
    ]
}
  )
}