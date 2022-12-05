#Public IP for NAT Gateway
#NAT Gateway

resource "aws_eip" "my_NAT_Gateway_IP" {
  vpc = true
}

resource "aws_nat_gateway" "my_NAT_Gateway" {
  count = 1
  allocation_id = aws_eip.my_NAT_Gateway_IP.id
  subnet_id     = aws_subnet.my_Public_Subnet_VPC_1[0].id

  tags = {
    Name = "NAT-Gateway"
  }
}

resource "aws_route_table" "my_NAT_Gateway_Route_Table" {
  vpc_id = aws_vpc.my_VPC[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_Internet_Gateway[0].id
  }
}

resource "aws_route_table_association" "my_NAT_Gateway_Route_Table_Association" {
  count = 1
  route_table_id = aws_route_table.my_NAT_Gateway_Route_Table.id
  subnet_id = aws_subnet.my_Private_Subnet_VPC_1[count.index].id
}