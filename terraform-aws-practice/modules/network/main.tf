#1. Create the VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    name = "${var.project_name}-vpc"
  }
}

#2. Create the public subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    name = "${var.project_name}-public-subnet"
    type = "Public"
  }
}

#3. Create the private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    name = "${var.project_name}-private-subnet"
    type = "private"
  }
}

#4. Create the internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    name = "${var.project_name}-igw"
  }
}

#5. Create the public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    name = "${var.project_name}-public-rt"
  }
}

#6. Route public subnet internet traffic to the IGW
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

#7. Associate the public subnet with it's route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

#8. Create the private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    name = "${var.project_name}-private-rt"
  }
}

#9. Allocate an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    name = "${var.project_name}-nat-eip"
  }

  depends_on = [aws_internet_gateway.main]
}

#10. Create the NAT Gateway in the public subnet
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    name = "${var.project_name}-nat"
  }

  depends_on = [aws_internet_gateway.main]
}

#11. Route private subnet internet traffic throguht NAT
resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

#12. Associate the private subnet with it's route table
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

