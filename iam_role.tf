resource "aws_iam_role" "sightline-iam-role" {
  name = "sightline-iam-role" # Name for the IAM role

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cloudwatch_logs_policy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"  # Adjust the policy as needed
  role       = aws_iam_role.sightline-iam-role.name
}

resource "aws_iam_policy" "s3_policy" {
  name        = "S3AccessPolicy" # Name for the IAM policy
  description = "Allows access to S3 buckets"

  # Define your S3 permissions policy here
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "s3_attachment" {
  name       = "sightline-s3-attachment"
  policy_arn = aws_iam_policy.s3_policy.arn
  roles      = [aws_iam_role.sightline-iam-role.name]
}
