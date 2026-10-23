resource "aws_instance" "ec2" {
  tags = {
    Name = "web-server"
  }
  ami                         = "ami-0d27e0fb3bac4d724"
  instance_type               = "t3.micro"
  key_name                    = "flm"
  subnet_id                   = aws_subnet.mysubnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]
}
