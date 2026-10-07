resource "aws_eip" "nat_ip" {
  tags = {
    Name = "Elastic-IP"
  }
  domain = "vpc"
}

