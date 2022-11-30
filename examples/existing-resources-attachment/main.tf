module "basenetworkingresources" {
  source                 = "../.."
  PROJECT_NAME           = "NewModules"
  PUBLIC_SUBNET_ID_LIST  = ["YourPublicSubnetsID(s)Here"]
  PRIVATE_SUBNET_ID_LIST = ["YourPrivateSubnetsID(s)Here"]
}