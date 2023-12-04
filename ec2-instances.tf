resource "aws_instance" "public_instance" {
  ami           = var.public_ami # Specify your desired AMI ID
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "flask-public" # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  tags = {
    Name = "public_instance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = var.private_ami # Specify your desired AMI ID
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = "flask-private" # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile = aws_iam_role.LVLP-infra.name
  tags = {
    Name = "private_instance"
  }
}
resource "aws_instance" "private_instance_2" {
  ami           = var.private_ami # Specify your desired AMI ID
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = "flask-private" # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile = aws_iam_role.LVLP-infra.name
  tags = {
    Name = "private_instance"
  }
}



output "public_instance_id" {
  value = aws_instance.public_instance.id
}

output "private_instance_id" {
  value = aws_instance.private_instance.id
}