resource "aws_route_table" "pub_rt" {
  tags = {
    Name = "Terraform-SUB-RT"
  }
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}


resource "aws_route_table" "pri_rt" {
  tags = {
    Name = "Terraform-PRI-RT"
  }
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ng.id
  }
}
