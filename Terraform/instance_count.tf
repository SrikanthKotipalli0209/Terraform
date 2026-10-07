resource "aws_instance" "ec2_count" {
  tags = {
    Name = "ec2_count-${count.index + 1}"
  }
  count         = 3
  ami           = "ami-0d27e0fb3bac4d724"
  instance_type = "t3.micro"
  key_name      = "flm"

  subnet_id = element([
    aws_subnet.mysubnet1.id,
    aws_subnet.mysubnet2.id,
  aws_subnet.mysubnet1.id], count.index)

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]
}
