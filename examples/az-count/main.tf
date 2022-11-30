module "basenetworkingresources" {
  source       = "../.."
  PROJECT_NAME = "NewModules"
  AZ_COUNT     = 2
  VPC_ID       = "your VPC ID here"
}