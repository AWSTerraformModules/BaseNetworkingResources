module "basenetworkingresources" {
  source       = "../.."
  PROJECT_NAME = "NewModules"
  AZ_COUNT     = 2
  VPC_ID       = "vpc-08c5dd41e8d7cb857"
}