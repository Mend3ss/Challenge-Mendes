#Public Subnet and NSG

resource "aws_subnet" "my_Public_Subnet" {
  count      = 2
  vpc_id     = aws_vpc.my_VPC[0].id
  cidr_block = "192.168.${1 + count.index}.0/24"


  tags = {
    Name = "${local.Company_Name_And_Enviroment_Dev}-${var.Public_Subnet_Name}"
  }
}


resource "aws_security_group" "my_Public_Subnet_NSG" {


  name        = "${var.Public_Subnet_NSG_Name}-${var.Enviroment_Dev}"
  description = "NSG for our Public Subnet"
  vpc_id      = aws_vpc.my_VPC[0].id

  tags = {
    Name = "${local.Company_Name_And_Enviroment_Dev}-${var.Public_Subnet_NSG_Name}"
  }

  # ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"
  #   cidr_blocks      = ["189.62.47.222/32", "54.232.26.136/32","186.192.143.189/32"]
  # }

  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }
}


locals {
  Public_Subnet_Rules_Map = {
    "22" : "22",
    "80" : "80",
    "8080" : "8080",
    "8081" : "8081",
    "443" : "443"
  }
}

resource "aws_security_group_rule" "my_Public_Subnet_NSG_Inbound" {

  for_each = local.Public_Subnet_Rules_Map

  type        = "ingress"
  description = "TLS from VPC"
  from_port   = 0
  to_port     = each.value
  protocol    = "tcp"
  cidr_blocks = ["189.62.47.222/32", "54.232.26.136/32", "186.192.143.189/32"]

  security_group_id = aws_security_group.my_Public_Subnet_NSG.id
}

resource "aws_security_group_rule" "my_Public_Subnet_NSG_Outbound" {
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]

  security_group_id = aws_security_group.my_Public_Subnet_NSG.id
}