resource "aws_instance" "ec2_foreach" {
  for_each = {
    ec2_1 = aws_subnet.mysubnet1.id
    ec2_2 = aws_subnet.mysubnet2.id
  }

  ami           = "ami-0d27e0fb3bac4d724"
  instance_type = "t3.micro"
  subnet_id     = each.value

  tags = {
    Name = each.key
  }
}
