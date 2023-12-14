# Create a custom route table for the public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.sightline_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sightline_igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

# Modify the route table of the private subnet to route internet-bound traffic through the NAT gateway
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.sightline_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.sightline_nat_gateway.id
  }

  tags = {
    Name = "private_route_table"
  }
}

# Associate the public route table with the public subnet
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate the private route table with the private subnet
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}
