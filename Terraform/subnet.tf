resource "aws_subnet" "mysubnet1" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Public-SN-1"
  }
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "mysubnet2" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Public-SN-2"
  }
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}


resource "aws_subnet" "mysubnet3" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Private-SN-2"
  }
  availability_zone = "us-east-1c"
  cidr_block        = "10.0.2.0/24"
}


resource "aws_subnet" "mysubnet4" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Private-SN-2"
  }
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.3.0/24"
}
