# Basic networking resources for general use

* This module dynamically creates AWS basic networking resources for general use across several architectural patterns
* It's very easy to attach and adapt existing resources instead of creating new ones, considering the variables/conditions applied as we will show below

## Diagram

![Amazon AWS Resources Diagram for VPC, Subnets, Internet Gateway and Availability Zones](https://user-images.githubusercontent.com/106110465/193930951-b6974bf3-1993-438b-82ae-87181b18e6ce.png "Basic Networking Infrastructure")

## Usage

* You will notice the commented TAG input, for more information, please check our [tags module](https://registry.terraform.io/modules/7clouds-terraform-modules/tags/aws/latest?tab=readme)

* By <b>all-attributes</b>, we mean using the optional arguments for configuring your deployment at it's maximum. Check terraform's registry to confirm each possible combination ([vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc), [subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet), [nat_gatway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway), [route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table), [security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)):

```hcl
module "basenetworkingresources" {
  source = "../.."

  PROJECT_NAME                                                   = "NewModules" # Avoid using spaces or special characters
  VPC_CIDR                                                       = "10.192.0.0/16"
  VPC_DNS_SUPPORT                                                = true
  VPC_DNS_HOSTNAMES                                              = true
  PUBLIC_SUBNETS_CIDR_BLOCK_LIST                                 = ["10.192.11.0/24", "10.192.12.0/24"]
  PRIVATE_SUBNETS_CIDR_BLOCK_LIST                                = ["10.192.21.0/24", "10.192.22.0/24"]
  NAT_GATEWAY_ELASTIC_IP_VPC_ATTACHED                            = true
  PUBLIC_ROUTE_TABLE_CIDR_BLOCK                                  = "0.0.0.0/0"
  PRIVATE_ROUTE_TABLES_CIDR_BLOCK                                = "0.0.0.0/0"
  PUBLIC_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION                    = true
  PRIVATE_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION                   = true
  CREATE_SECURITY_GROUP                                          = true
  SECURITY_GROUP_INGRESS_FROM_PORT                               = 0
  SECURITY_GROUP_INGRESS_TO_PORT                                 = 65535
  SECURITY_GROUP_INGRESS_RULES_PROTOCOL                          = "tcp"
  SECURITY_GROUP_INGRESS_CIDR_BLOCK                              = "0.0.0.0/0"
  SECURITY_GROUP_EGRESS_FROM_PORT                                = 0
  SECURITY_GROUP_EGRESS_TO_PORT                                  = 65535
  SECURITY_GROUP_EGRESS_RULES_PROTOCOL                           = "tcp"
  SECURITY_GROUP_EGRESS_CIDR_BLOCK                               = "0.0.0.0/0"
  # TAGS                                                           = module.tags.TAGS
  VPC_INSTANCE_TENENCY                                           = "default or dedicated"
  VPC_IPV4_IPAM_POOL_ID                                          = "your IPV4 IPAM POOL here"
  VPC_IPV4_NETMASK_LENGTH                                        = "your IPV4 netmask length here"
  VPC_IPV6_CIDR_BLOCK                                            = "your IPV6 CIDR block here"
  VPC_IPV6_IPAM_POOL_ID                                          = "your IPV6 IPAM POOL ID here"
  VPC_IPV6_NETMASK_LENGTH                                        = "your IPV6 netmask length here"
  VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP                       = "your IPV6 CIDR block network border group here"
  VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK                           = "true or false"
  PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION                 = "true or false"
  PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID                            = "your AZ ID here"
  PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL                        = "your customer owned IPv4 address pool here"
  PUBLIC_SUBNETS_ENABLE_DNS64                                    = "true or false"
  PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH  = "true or false"
  PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH     = "true or false"
  PUBLIC_SUBNETS_IPV6_CIDR_BLOCK                                 = "your IPV6 CIDR block here"
  PUBLIC_SUBNETS_IPV6_NATIVE                                     = "true or false"
  PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH                 = "true or false"
  PUBLIC_SUBNETS_OUTPOST_ARN                                     = "your outpost arn here"
  PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH             = "ip-name or resource-name"
  PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION                = "true or false"
  PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID                           = "your AZ ID here"
  PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL                       = "your customer owned IPv4 address pool here"
  PRIVATE_SUBNETS_ENABLE_DNS64                                   = "true or false"
  PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH = "true or false"
  PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH    = "true or false"
  PRIVATE_SUBNETS_IPV6_CIDR_BLOCK                                = "your IPV6 CIDR block here"
  PRIVATE_SUBNETS_IPV6_NATIVE                                    = "true or false"
  PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH                = "true or false"
  PRIVATE_SUBNETS_OUTPOST_ARN                                    = "your outpost arn here"
  PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH            = "ip-name or resource-name"
  NAT_GATEWAYS_CONNECTIVITY_TYPE                                 = "private or public"
  PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS                            = ["enter your virtual gateways for propagation"]
  PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS                          = ["enter your virtual gateways for propagation"]
  SECURITY_GROUP_NAME                                            = "your Security Group name here"
  SECURITY_GROUP_NAME_PREFIX                                     = "your Security Group name prefix here"
  SECURITY_GROUP_REVOKE_RULES_ON_DELETE                          = "true or false"
}
```
