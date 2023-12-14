# Create an Internet Gateway
resource "aws_internet_gateway" "sightline_igw" {
  vpc_id = aws_vpc.sightline_vpc.id
}
