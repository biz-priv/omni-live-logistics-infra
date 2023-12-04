resource "aws_vpc" "flask_vpc" {
  cidr_block = var.vpc_cidr # Change the CIDR block as needed
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "flask_vpc" # Set the VPC name as "flask_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.flask_vpc.id
  cidr_block = var.public_cidr # Specify the public subnet CIDR block
  availability_zone = var.az1 # Specify the desired availability zone
  map_public_ip_on_launch = true # Make the subnet public
  tags = {
    Name = "public_subnet" # Set the subnet name as "public_subnet"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.flask_vpc.id
  cidr_block = var.public_cidr_2 # Specify the public subnet CIDR block
  availability_zone = var.az1 # Specify the desired availability zone
  map_public_ip_on_launch = true # Make the subnet public
  tags = {
    Name = "public_subnet" # Set the subnet name as "public_subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.flask_vpc.id
  cidr_block = var.private_cidr # Specify the private subnet CIDR block
  availability_zone = var.az2 # Specify the desired availability zone for the private subnet
  map_public_ip_on_launch = false # Make the subnet private (no public IP)
  tags = {
    Name = "private_subnet" # Set the subnet name as "private_subnet"
  }
}

output "vpc_id" {
  value = aws_vpc.flask_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}


