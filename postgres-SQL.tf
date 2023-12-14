#  rds db
resource "aws_db_instance" "sightline_db" {
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  engine               = "postgres"
  engine_version       = "14.6"
  instance_class       = var.db_instance_type
  identifier           = var.db_identifier
  db_name              = "sightlinedb"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres14"
  skip_final_snapshot  = true

  # VPC configuration
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name      = aws_db_subnet_group.sightline_db_subnet_group.name
}

resource "aws_db_subnet_group" "sightline_db_subnet_group" {
  name       = "sightline-db-subnet-group"
  description = "Subnet group for sightline RDS PostgreSQL"
  subnet_ids = [aws_subnet.private_subnet.id,aws_subnet.public_subnet.id]
}

