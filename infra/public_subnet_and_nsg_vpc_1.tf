#VPC 1
#Public Subnet and NSG

resource "aws_subnet" "my_Public_Subnet_VPC_1" {
  count      = 2
  vpc_id     = aws_vpc.my_VPC[0].id
  cidr_block = "192.168.${1 + count.index}.0/24"


  tags = {
    Name = "${local.Company_Name_And_Enviroment_Prod}-${var.Public_Subnet_Name}-${1 + count.index}-${"VPC-1"}"
  }
}


resource "aws_security_group" "my_Public_Subnet_NSG_VPC_1" {


  name        = "${var.Public_Subnet_NSG_Name}-${var.Enviroment_Prod}"
  description = "NSG for our Public Subnet"
  vpc_id      = aws_vpc.my_VPC[0].id

  tags = {
    Name = "${local.Company_Name_And_Enviroment_Prod}-${var.Public_Subnet_NSG_Name}-${"VPC-1"}"
  }
}


resource "aws_security_group_rule" "SSH_Rule_VPC_1" {
  type        = "ingress"
  description = "Opening SSH "
  from_port   = 0
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["Your IP"]

  security_group_id = aws_security_group.my_Public_Subnet_NSG_VPC_1.id
}


locals {
  Public_Subnet_Rules_Map_VPC_1 = {
    "80" : "80",
    "8080" : "8080",
    "8081" : "8081",
    "443" : "443"
  }
}

resource "aws_security_group_rule" "my_Public_Subnet_NSG_Inbound_VPC_1" {

  for_each = local.Public_Subnet_Rules_Map_VPC_1

  type        = "ingress"
  description = "TLS from VPC"
  from_port   = 0
  to_port     = each.value
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.my_Public_Subnet_NSG_VPC_1.id
}

resource "aws_security_group_rule" "my_Public_Subnet_NSG_Outbound_VPC_1" {
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]

  security_group_id = aws_security_group.my_Public_Subnet_NSG_VPC_1.id
}
