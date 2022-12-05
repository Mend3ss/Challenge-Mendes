#VPC 1
#Private Subnet and NSG

resource "aws_subnet" "my_Private_Subnet_VPC_1" {
  count      = 2
  vpc_id     = aws_vpc.my_VPC[0].id
  cidr_block = "192.168.${3 + count.index}.0/24"


  tags = {
    Name = "${local.Company_Name_And_Enviroment_Prod}-${var.Private_Subnet_Name}-${1 + count.index}-${"VPC-1"}"
  }
}

resource "aws_security_group" "my_Private_Subnet_NSG_VPC_1" {
  vpc_id = aws_vpc.my_VPC[0].id
  name   = "${local.Company_Name_And_Enviroment_Prod}-${var.Private_Subnet_Name}-${"NSG"}-${"VPC-1"}"

  tags = {
    Name = "${local.Company_Name_And_Enviroment_Prod}-${var.Private_Subnet_Name}-${"NSG"}-${"VPC-1"}"
  }
}

resource "aws_security_group_rule" "my_Private_Subnet_NSG_Outbound_VPC_1" {
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]

  security_group_id = aws_security_group.my_Private_Subnet_NSG_VPC_1.id
}