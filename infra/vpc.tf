#VPC
#Internet Gateway

resource "aws_vpc" "my_VPC" {
  count                = 2
  cidr_block           = var.VPC_Cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${local.Company_Name_And_Enviroment_Prod}-${var.VPC_Name}-${1 + count.index}"
  }

}

resource "aws_internet_gateway" "my_Internet_Gateway" {

  count = 2

  vpc_id = aws_vpc.my_VPC[count.index].id

}

resource "aws_internet_gateway_attachment" "my_Internet_Gateway_Attachment" {

  count = 2

  internet_gateway_id = aws_internet_gateway.my_Internet_Gateway[count.index].id
  vpc_id              = aws_vpc.my_VPC[count.index].id
}

resource "aws_route" "my_Route_Table" {
  count = 1

  route_table_id         = aws_vpc.my_VPC[count.index].default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_Internet_Gateway[count.index].id
}

 