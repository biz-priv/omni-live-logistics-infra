# Create an Internet Gateway
resource "aws_internet_gateway" "flask_igw" {
  vpc_id = aws_vpc.flask_vpc.id
}
