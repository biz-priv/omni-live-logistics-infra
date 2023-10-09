# Create an Elastic IP address for the NAT gateway
resource "aws_eip" "nat_eip" {
  vpc = true
}

# Create a NAT gateway in the public subnet
resource "aws_nat_gateway" "flask_nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

