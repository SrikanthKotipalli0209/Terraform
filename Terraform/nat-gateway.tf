resource "aws_nat_gateway" "ng" {
  tags = {
    Name = "Nat-Gateway"
  }
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.mysubnet1.id
  depends_on = [
    aws_internet_gateway.myigw
  ]
}

