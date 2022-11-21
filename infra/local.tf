locals {


  Owners          = var.Company_Name
  Enviroment_Dev  = var.Enviroment_Dev
  Enviroment_Prod = var.Enviroment_Prod

  Company_Name_And_Enviroment_Dev  = "${var.Company_Name}-${var.Enviroment_Dev}"
  Company_Name_And_Enviroment_Prod = "${var.Company_Name}-${var.Enviroment_Prod}"


  common_tags = {
    Owners          = local.Owners,
    Enviroment_Dev  = local.Enviroment_Dev
    Enviroment_Prod = local.Enviroment_Prod
  }
}