#VPC Name / Nome VPC / Nombre VPC
#VPC Cidr
#Public Subnet / Sub-rede Publica / Subred público
#Private Subnet / Sub-rede Privada / Subred Privada
#Database Subnet / Sub-rede Banco de Dados / Subred Banco de Datos


#VPC Name / Nome VPC / Nombre VPC

variable "VPC_Name" {
  description = "Name for our VPC"
  type        = string
  default     = "VPC"
}

#VPC Cidr

variable "VPC_Cidr" {
  description = "Cidr block of VPC"
  type        = string
  default     = "192.168.0.0/16"
}



#Public Subnet / Subnet Publica / Subnet público

variable "Public_Subnet_Name" {
  description = "Name of Public Subnet"
  type        = string
  default     = "Public_Subnet"
}


#Public Subnet NSG

variable "Public_Subnet_NSG_Name" {
  description = "Name of our NSG for Public Subnet"
  type        = string
  default     = "Public_Subnet_NSG"
}



#Private Subnet / Subnet Privada / Subnet Privada

variable "Private_Subnet_Name" {
  description = "Name of Private Subnet"
  type        = string
  default     = "Private_Subnet"
}


#Private Subnet NSG

variable "Private_Subnet_NSG_Name" {
  description = "Name of our NSG for Private Subnet"
  type        = string
  default     = "Private_Subnet_NSG"
}



#Database Name / Subnet Banco de Dados / Subnet Banco de Datos

variable "Database_Subnet_Name" {
  description = "Name of Database Name"
  type        = string
  default     = "Database Subnet"
}