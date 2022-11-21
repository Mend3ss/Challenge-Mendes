#Company Name / Nome da Empresa / Nombre de la empresa
#Enviroment / Ambiente
#Location / Localização / Ubicación


##Business Name / Nome da Empresa / Nombre de la empresa

variable "Company_Name" {
  description = "Name our Company"
  type        = string
  default     = "Darede"
}

##Enviroment / Ambiente

variable "Enviroment_Dev" {
  description = "Enviroment of our Infrastructure"
  type        = string
  default     = "Dev"
}

variable "Enviroment_Prod" {
  description = "Enviroment of our Infrastructure"
  type        = string
  default     = "Prod"
}

# Location / Localização / Ubicación

variable "Location" {
  description = "Location for our resources"
  type        = string
  default     = "us-east-1"
}