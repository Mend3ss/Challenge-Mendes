#VPC
#Internet Gateway

resource "aws_vpc" "my_VPC" {
  count                = 2
  cidr_block           = var.VPC_Cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${local.Company_Name_And_Enviroment_Dev}-${var.VPC_Name}-${1 + count.index}"
  }
}

resource "aws_internet_gateway" "my_Internet_Gateway" {

  count = 1

  vpc_id = aws_vpc.my_VPC[0].id

}

resource "aws_internet_gateway_attachment" "my_Internet_Gateway_Attachment" {

  count = 1

  internet_gateway_id = aws_internet_gateway.my_Internet_Gateway[0].id
  vpc_id              = aws_vpc.my_VPC[0].id
}