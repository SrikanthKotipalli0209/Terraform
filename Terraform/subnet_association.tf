resource "aws_route_table_association" "ass1" {
  route_table_id = aws_route_table.pub_rt.id
  subnet_id      = aws_subnet.mysubnet1.id
}


resource "aws_route_table_association" "ass2" {
  route_table_id = aws_route_table.pub_rt.id
  subnet_id      = aws_subnet.mysubnet2.id
}


resource "aws_route_table_association" "ass3" {
  route_table_id = aws_route_table.pri_rt.id
  subnet_id      = aws_subnet.mysubnet3.id
}


resource "aws_route_table_association" "ass4" {
  route_table_id = aws_route_table.pri_rt.id
  subnet_id      = aws_subnet.mysubnet4.id
}
