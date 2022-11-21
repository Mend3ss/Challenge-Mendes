#EC2
#NIC
#Key

variable "Key_Name" {
  description = "Name of our ssh key"
  type        = string
  default     = "Key_Name"
}

variable "EC2_SO_Type" {
  description = "Select the type of SO"
  type        = string
  default     = "ubuntu"
}

variable "EC2_Name" {
  description = "Name for our EC2"
  type        = string
  default     = "Container-EC2"
}

variable "EC2_Ami" {
  description = "Ami version of our Instance"
  type        = string
  default     = "ami-09d3b3274b6c5d4aa"
}

variable "EC2_Size" {
  description = "Size that will be used in EC2"
  type        = string
  default     = "t2.micro"
}

variable "NIC_Name" {
  description = "Name for NIC"
  type        = string
  default     = "EC2_NIC"
}

variable "NIC_Private_IP" {
  description = "IP address associate with the NIC"
  type        = string
  default     = "192.168.1.10/24"
}