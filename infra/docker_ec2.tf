#EC2
#NIC
#Elastic IP

resource "aws_network_interface" "my_Docker_EC2_NIC" {

  count = 1

  subnet_id       = aws_subnet.my_Public_Subnet_VPC_1[count.index].id
  private_ips     = ["192.168.1.10"]
  security_groups = [aws_security_group.my_Public_Subnet_NSG_VPC_1.id]

  tags = {
    Name = "Docker_EC2_NIC"
  }
}


resource "aws_instance" "my_Docker_EC2" {

  count = 1

  ami           = var.EC2_Ami
  instance_type = var.EC2_Size
  key_name      = "Name of your key"

  network_interface {
    network_interface_id = aws_network_interface.my_Docker_EC2_NIC[count.index].id
    device_index         = 0
  }

  tags = {
    Name = var.EC2_Name
  }
}

resource "aws_eip" "my_Public_IP_Docker_EC2" {

  count = 1

  vpc                       = true
  instance                  = aws_instance.my_Docker_EC2[count.index].id
  associate_with_private_ip = "192.168.1.10"
  network_interface         = aws_network_interface.my_Docker_EC2_NIC[count.index].id
}

resource "aws_eip_association" "eip_assoc" {

  count = 1

  instance_id   = aws_instance.my_Docker_EC2[count.index].id
  allocation_id = aws_eip.my_Public_IP_Docker_EC2[count.index].id
}
