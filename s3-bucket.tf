# s3 bucket

# Create an S3 bucket with a private ACL
resource "aws_s3_bucket" "sightline-heroku" {
  bucket = var.bucket_name
  # acl    = "private"
}

# Create an S3 VPC endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.sightline_vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
}

# Configure egress security group rule to allow access to the S3 VPC endpoint
resource "aws_security_group_rule" "s3_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  security_group_id = aws_security_group.private_sg.id # Replace with your private security group ID
  cidr_blocks = ["10.0.0.0/16"]
}