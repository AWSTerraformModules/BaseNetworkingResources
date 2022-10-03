output "VPC_ID" {
  value       = module.basenetworkingresources.VPC_ID
  description = "Explicit VPC ID to overrule creation of default VPC"
}

output "INTERNET_GATEWAY_ID" {
  value       = module.basenetworkingresources.INTERNET_GATEWAY_ID
  description = "Explicit Internet Gateway ID to overrule creation of default Internet Gateway"
}

output "PUBLIC_SUBNET_ID_LIST" {
  value       = module.basenetworkingresources.PUBLIC_SUBNET_ID_LIST
  description = "Explicit Public Subnet ID List to overrule creation of Public Subnets"
}

output "PRIVATE_SUBNET_ID_LIST" {
  value       = module.basenetworkingresources.PRIVATE_SUBNET_ID_LIST
  description = "Explicit Private Subnet ID List to overrule creation of Private Subnets"
}

output "ELASTIC_IP_ALLOCATION_ID_LIST" {
  value       = module.basenetworkingresources.ELASTIC_IP_ALLOCATION_ID_LIST
  description = "Explicit Elastic IP ID List to overrule creation of Elastic IPs"
}

output "NAT_GATEWAY_ID_LIST" {
  value       = module.basenetworkingresources.NAT_GATEWAY_ID_LIST
  description = "Explicit NAT Gateway ID List to overrule creation of Nat Gateways"
}

output "PUBLIC_ROUTE_TABLE_ID" {
  value       = module.basenetworkingresources.PUBLIC_ROUTE_TABLE_ID
  description = "Explicit Public Route Table ID to overrule creation of Public Route Table"
}

output "PRIVATE_ROUTE_TABLE_ID_LIST" {
  value       = module.basenetworkingresources.PRIVATE_ROUTE_TABLE_ID_LIST
  description = "Explicit Private Route Table ID List to overrule creation of Private Route Tables"
}

output "SECURITY_GROUP_ID" {
  value       = module.basenetworkingresources.SECURITY_GROUP_ID
  description = "Explicit Security Group ID to use in other modules according to your needs"
}