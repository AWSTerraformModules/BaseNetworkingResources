module "basenetworkingresources" {
  source                 = "../.."
  PROJECT_NAME           = "NewModules"
  PUBLIC_SUBNET_ID_LIST  = ["subnet-0509bda19a415980b", "subnet-0513ac6e1496448ab"]
  PRIVATE_SUBNET_ID_LIST = ["subnet-031c22c3c743d1196", "subnet-0290c08b019237dca"]
}