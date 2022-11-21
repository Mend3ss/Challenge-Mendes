#Private Subnet and NSG

resource "aws_subnet" "my_Private_Subnet" {
  count      = 2
  vpc_id     = aws_vpc.my_VPC[0].id
  cidr_block = "192.168.${3 + count.index}.0/24"


  tags = {
    Name = "${local.Company_Name_And_Enviroment_Dev}-${var.Private_Subnet_Name}"
  }
}

resource "aws_security_group" "my_Private_Subnet_NSG" {
  vpc_id = aws_vpc.my_VPC[0].id
  name   = "${local.Company_Name_And_Enviroment_Dev}-${var.Private_Subnet_Name}-${"NSG"}"

  tags = {
    Name = "${local.Company_Name_And_Enviroment_Dev}-${var.Private_Subnet_Name}-${"NSG"}"
  }
}