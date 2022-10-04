# Base Networking Resources Module by 7Clouds
Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%! Check it out at https://seventechnologies.cloud/

Please rank this repo 5 starts if you like our job!

## Usage
For <b>specified az</b> deployments, we may use the count argument ("AZ_COUNT" variable) and combine it with many different configurations:

* Check each condition applied on the resources, considering terraform's syntax for [Conditions Expressions](https://www.terraform.io/language/expressions/conditionals) and [Arithmetic and Logical Operators](https://www.terraform.i/language/expressions/operators) for more details

* You will be able to compose the infrastructure according to your needs

* Please, find further information and a visual example below:
```hcl
# In order to properly deploy your module, keep in mind that if there are associations already made between arguments passed on: 
# (PRIVATE_SUBNET_ID_LIST and PRIVATE_ROUTE_TABLE_ID_LIST) or (PUBLIC_SUBNET_ID_LIST and PUBLIC_ROUTE_TABLE_ID)
# The deployment will not perform as expected, there may be failures on the deployment/configuration
#
# This module always creates AT LEAST a security group unless you specify CREATE_SECURITY_GROUP as false
#
# Use AZ_COUNT only if you want to create the whole infrastructure besides VPC and Internet Gateway
#
# Full example below (Check our other examples in 'examples' folder):

module "basenetworkingresources" {
  source = "../.."
  # Essential Variables
  PROJECT_NAME = "NewModules" # Avoid using spaces or special characters

  # Structural Variables
  AZ_COUNT                                     = 1 # Use this attribute only if you want to limit the amount of AZs and sub resources this module will create on its own. If you're providing your own public and private subnets, elastic IPs, nat gateways, route tables and security group DO NOT USE this attribute. If you want to attach existing resources, you must provide their ID's on the variables with "_ID" suffix.
  VPC_ID                                       = "vpc-08c5dd41e8d7cb857"
  VPC_CIDR                                     = "10.192.0.0/16"
  VPC_DNS_SUPPORT                              = true
  VPC_DNS_HOSTNAMES                            = true
  INTERNET_GATEWAY_ID                          = "igw-034559b377ce9eff4"
  PUBLIC_SUBNET_ID_LIST                        = ["subnet-0509bda19a415980b", "subnet-0513ac6e1496448ab"] # If count PUBLIC_SUBNET_ID_LIST != ELASTIC_IP_ALLOCATION_ID_LIST there may be failures on the deployment/configuration
  PUBLIC_SUBNETS_CIDR_BLOCK_LIST               = ["10.192.11.0/24", "10.192.12.0/24"]
  PRIVATE_SUBNET_ID_LIST                       = ["subnet-031c22c3c743d1196", "subnet-0290c08b019237dca"]
  PRIVATE_SUBNETS_CIDR_BLOCK_LIST              = ["10.192.21.0/24", "10.192.22.0/24"]
  ELASTIC_IP_ALLOCATION_ID_LIST                = ["eipalloc-0b0db65959bc71a04", "eipalloc-079734529e7f86285"]
  NAT_GATEWAY_ID_LIST                          = ["abc", "abc"]
  NAT_GATEWAY_ELASTIC_IP_VPC_ATTACHED          = true
  PUBLIC_ROUTE_TABLE_ID                        = "abc"
  PUBLIC_ROUTE_TABLE_CIDR_BLOCK                = "0.0.0.0/0"
  PRIVATE_ROUTE_TABLE_ID_LIST                  = ["abc", "abc"]
  PRIVATE_ROUTE_TABLES_CIDR_BLOCK              = "0.0.0.0/0"
  PUBLIC_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION  = true
  PRIVATE_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION = true
  CREATE_SECURITY_GROUP                        = true
  SECURITY_GROUP_INGRESS_FROM_PORT             = 0
  SECURITY_GROUP_INGRESS_TO_PORT               = 65535
  SECURITY_GROUP_INGRESS_RULES_PROTOCOL        = "tcp"
  SECURITY_GROUP_INGRESS_CIDR_BLOCK            = "0.0.0.0/0"
  SECURITY_GROUP_EGRESS_FROM_PORT              = 0
  SECURITY_GROUP_EGRESS_TO_PORT                = 65535
  SECURITY_GROUP_EGRESS_RULES_PROTOCOL         = "tcp"
  SECURITY_GROUP_EGRESS_CIDR_BLOCK             = "0.0.0.0/0"

  # Optional Variables
  VPC_INSTANCE_TENENCY                                           = null
  VPC_IPV4_IPAM_POOL_ID                                          = null
  VPC_IPV4_NETMASK_LENGTH                                        = null
  VPC_IPV6_CIDR_BLOCK                                            = null
  VPC_IPV6_IPAM_POOL_ID                                          = null
  VPC_IPV6_NETMASK_LENGTH                                        = null
  VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP                       = null
  VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK                           = null
  PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION                 = null
  PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID                            = null
  PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL                        = null
  PUBLIC_SUBNETS_ENABLE_DNS64                                    = null
  PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH  = null
  PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH     = null
  PUBLIC_SUBNETS_IPV6_CIDR_BLOCK                                 = null
  PUBLIC_SUBNETS_IPV6_NATIVE                                     = null
  PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH                 = null
  PUBLIC_SUBNETS_OUTPOST_ARN                                     = null
  PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH             = null
  PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION                = null
  PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID                           = null
  PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL                       = null
  PRIVATE_SUBNETS_ENABLE_DNS64                                   = null
  PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH = null
  PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH    = null
  PRIVATE_SUBNETS_IPV6_CIDR_BLOCK                                = null
  PRIVATE_SUBNETS_IPV6_NATIVE                                    = null
  PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH                = null
  PRIVATE_SUBNETS_OUTPOST_ARN                                    = null
  PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH            = null
  NAT_GATEWAYS_CONNECTIVITY_TYPE                                 = null
  PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS                            = null
  PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS                          = null
  SECURITY_GROUP_NAME                                            = null
  SECURITY_GROUP_NAME_PREFIX                                     = null
  SECURITY_GROUP_REVOKE_RULES_ON_DELETE                          = null
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_basenetworkingresources"></a> [basenetworkingresources](#module\_basenetworkingresources) | ./modules | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eip.elastic_ips](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateways](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_tables](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnets_route_table_associations](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnets_route_table_associations](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available_az](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AZ_COUNT"></a> [AZ\_COUNT](#input\_AZ\_COUNT) | Fixed number of AZs to create resources | `number` | `0` | no |
| <a name="input_CREATE_SECURITY_GROUP"></a> [CREATE\_SECURITY\_GROUP](#input\_CREATE\_SECURITY\_GROUP) | To overwrite creation of Security Group | `bool` | `true` | no |
| <a name="input_ELASTIC_IPS_ADDRESS"></a> [ELASTIC\_IPS\_ADDRESS](#input\_ELASTIC\_IPS\_ADDRESS) | IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs | `any` | `null` | no |
| <a name="input_ELASTIC_IPS_ASSOCIATE_WITH_PRIVATE_IP"></a> [ELASTIC\_IPS\_ASSOCIATE\_WITH\_PRIVATE\_IP](#input\_ELASTIC\_IPS\_ASSOCIATE\_WITH\_PRIVATE\_IP) | User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address | `any` | `null` | no |
| <a name="input_ELASTIC_IPS_CUSTOMER_OWNED_IPV4_POOL"></a> [ELASTIC\_IPS\_CUSTOMER\_OWNED\_IPV4\_POOL](#input\_ELASTIC\_IPS\_CUSTOMER\_OWNED\_IPV4\_POOL) | ID of a customer-owned address pool | `any` | `null` | no |
| <a name="input_ELASTIC_IPS_INSTANCE"></a> [ELASTIC\_IPS\_INSTANCE](#input\_ELASTIC\_IPS\_INSTANCE) | EC2 instance ID | `any` | `null` | no |
| <a name="input_ELASTIC_IPS_NETWORK_BORDER_GROUP"></a> [ELASTIC\_IPS\_NETWORK\_BORDER\_GROUP](#input\_ELASTIC\_IPS\_NETWORK\_BORDER\_GROUP) | Location from which the IP address is advertised. Use this parameter to limit the address to this location | `any` | `null` | no |
| <a name="input_ELASTIC_IPS_NETWORK_INTERFACE"></a> [ELASTIC\_IPS\_NETWORK\_INTERFACE](#input\_ELASTIC\_IPS\_NETWORK\_INTERFACE) | Network interface ID to associate with | `any` | `null` | no |
| <a name="input_ELASTIC_IPS_PUBLIC_IPV4_POOL"></a> [ELASTIC\_IPS\_PUBLIC\_IPV4\_POOL](#input\_ELASTIC\_IPS\_PUBLIC\_IPV4\_POOL) | EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs | `any` | `null` | no |
| <a name="input_ELASTIC_IP_ALLOCATION_ID_LIST"></a> [ELASTIC\_IP\_ALLOCATION\_ID\_LIST](#input\_ELASTIC\_IP\_ALLOCATION\_ID\_LIST) | Explicit Elastic IP ID List to overrule creation of Elastic IPs | `list(string)` | `[]` | no |
| <a name="input_INTERNET_GATEWAY_ID"></a> [INTERNET\_GATEWAY\_ID](#input\_INTERNET\_GATEWAY\_ID) | Explicit Internet Gateway ID to overrule creation of default Internet Gateway | `string` | `""` | no |
| <a name="input_NAT_GATEWAYS_CONNECTIVITY_TYPE"></a> [NAT\_GATEWAYS\_CONNECTIVITY\_TYPE](#input\_NAT\_GATEWAYS\_CONNECTIVITY\_TYPE) | Connectivity type for the gateway. Valid values are private and public. Defaults to public | `any` | `null` | no |
| <a name="input_NAT_GATEWAY_ELASTIC_IP_VPC_ATTACHED"></a> [NAT\_GATEWAY\_ELASTIC\_IP\_VPC\_ATTACHED](#input\_NAT\_GATEWAY\_ELASTIC\_IP\_VPC\_ATTACHED) | To set as false for mapping public ip on launch | `bool` | `true` | no |
| <a name="input_NAT_GATEWAY_ID_LIST"></a> [NAT\_GATEWAY\_ID\_LIST](#input\_NAT\_GATEWAY\_ID\_LIST) | Explicit NAT Gateway ID List to overrule creation of Nat Gateways | `list(string)` | `[]` | no |
| <a name="input_PRIVATE_ROUTE_TABLES_CIDR_BLOCK"></a> [PRIVATE\_ROUTE\_TABLES\_CIDR\_BLOCK](#input\_PRIVATE\_ROUTE\_TABLES\_CIDR\_BLOCK) | The CIDR block of the route | `string` | `"0.0.0.0/0"` | no |
| <a name="input_PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS"></a> [PRIVATE\_ROUTE\_TABLES\_PROPAGATING\_VGWS](#input\_PRIVATE\_ROUTE\_TABLES\_PROPAGATING\_VGWS) | A list of virtual gateways for propagation | `any` | `null` | no |
| <a name="input_PRIVATE_ROUTE_TABLE_ID_LIST"></a> [PRIVATE\_ROUTE\_TABLE\_ID\_LIST](#input\_PRIVATE\_ROUTE\_TABLE\_ID\_LIST) | Explicit Private Route Table ID List to overrule creation of Private Route Tables | `list(string)` | `[]` | no |
| <a name="input_PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION"></a> [PRIVATE\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION](#input\_PRIVATE\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID"></a> [PRIVATE\_SUBNETS\_AVAILABILITY\_ZONE\_ID](#input\_PRIVATE\_SUBNETS\_AVAILABILITY\_ZONE\_ID) | AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability\_zone instead | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_CIDR_BLOCK_LIST"></a> [PRIVATE\_SUBNETS\_CIDR\_BLOCK\_LIST](#input\_PRIVATE\_SUBNETS\_CIDR\_BLOCK\_LIST) | Explicit Private Subnet CIDR Block List to overrule creation pattern of Public Subnets. If filled out, this attribute needs to have as many items as the amount of AZs in the selected region if var "AZ\_COUNT" is not set, or with the same amount of var "AZ\_COUNT" otherwise | `list(string)` | `[]` | no |
| <a name="input_PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL"></a> [PRIVATE\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL](#input\_PRIVATE\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL) | The customer owned IPv4 address pool. Typically used with the map\_customer\_owned\_ip\_on\_launch argument. The outpost\_arn argument must be specified when configured | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_ENABLE_DNS64"></a> [PRIVATE\_SUBNETS\_ENABLE\_DNS64](#input\_PRIVATE\_SUBNETS\_ENABLE\_DNS64) | Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH](#input\_PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH](#input\_PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION"></a> [PRIVATE\_SUBNETS\_HAVE\_ROUTE\_TABLE\_ASSOCIATION](#input\_PRIVATE\_SUBNETS\_HAVE\_ROUTE\_TABLE\_ASSOCIATION) | To define that provided private subnet list already has association to provided Route Table | `bool` | `false` | no |
| <a name="input_PRIVATE_SUBNETS_IPV6_CIDR_BLOCK"></a> [PRIVATE\_SUBNETS\_IPV6\_CIDR\_BLOCK](#input\_PRIVATE\_SUBNETS\_IPV6\_CIDR\_BLOCK) | The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_IPV6_NATIVE"></a> [PRIVATE\_SUBNETS\_IPV6\_NATIVE](#input\_PRIVATE\_SUBNETS\_IPV6\_NATIVE) | Indicates whether to create an IPv6-only subnet. Default: false | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH](#input\_PRIVATE\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH) | Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer\_owned\_ipv4\_pool and outpost\_arn arguments must be specified when set to true. Default is false | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_OUTPOST_ARN"></a> [PRIVATE\_SUBNETS\_OUTPOST\_ARN](#input\_PRIVATE\_SUBNETS\_OUTPOST\_ARN) | The Amazon Resource Name (ARN) of the Outpost | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH](#input\_PRIVATE\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name | `any` | `null` | no |
| <a name="input_PRIVATE_SUBNET_ID_LIST"></a> [PRIVATE\_SUBNET\_ID\_LIST](#input\_PRIVATE\_SUBNET\_ID\_LIST) | Explicit Private Subnet ID List to overrule creation of Private Subnets | `list(string)` | `[]` | no |
| <a name="input_PROJECT_NAME"></a> [PROJECT\_NAME](#input\_PROJECT\_NAME) | The project name that will be prefixed to resource names | `string` | n/a | yes |
| <a name="input_PUBLIC_ROUTE_TABLE_CIDR_BLOCK"></a> [PUBLIC\_ROUTE\_TABLE\_CIDR\_BLOCK](#input\_PUBLIC\_ROUTE\_TABLE\_CIDR\_BLOCK) | The CIDR block of the route | `string` | `"0.0.0.0/0"` | no |
| <a name="input_PUBLIC_ROUTE_TABLE_ID"></a> [PUBLIC\_ROUTE\_TABLE\_ID](#input\_PUBLIC\_ROUTE\_TABLE\_ID) | Explicit Public Route Table ID to overrule creation of Public Route Table | `string` | `""` | no |
| <a name="input_PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS"></a> [PUBLIC\_ROUTE\_TABLE\_PROPAGATING\_VGWS](#input\_PUBLIC\_ROUTE\_TABLE\_PROPAGATING\_VGWS) | A list of virtual gateways for propagation | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION"></a> [PUBLIC\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION](#input\_PUBLIC\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID"></a> [PUBLIC\_SUBNETS\_AVAILABILITY\_ZONE\_ID](#input\_PUBLIC\_SUBNETS\_AVAILABILITY\_ZONE\_ID) | AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability\_zone instead | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_CIDR_BLOCK_LIST"></a> [PUBLIC\_SUBNETS\_CIDR\_BLOCK\_LIST](#input\_PUBLIC\_SUBNETS\_CIDR\_BLOCK\_LIST) | Explicit Public Subnet CIDR Block List to overrule creation pattern of Public Subnets. If filled out, this attribute needs to have as many items as the amount of AZs in the selected region if var "AZ\_COUNT" is not set, or with the same amount of var "AZ\_COUNT" otherwise | `list(string)` | `[]` | no |
| <a name="input_PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL"></a> [PUBLIC\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL](#input\_PUBLIC\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL) | The customer owned IPv4 address pool. Typically used with the map\_customer\_owned\_ip\_on\_launch argument. The outpost\_arn argument must be specified when configured | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_ENABLE_DNS64"></a> [PUBLIC\_SUBNETS\_ENABLE\_DNS64](#input\_PUBLIC\_SUBNETS\_ENABLE\_DNS64) | Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH](#input\_PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH](#input\_PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION"></a> [PUBLIC\_SUBNETS\_HAVE\_ROUTE\_TABLE\_ASSOCIATION](#input\_PUBLIC\_SUBNETS\_HAVE\_ROUTE\_TABLE\_ASSOCIATION) | To define that provided public subnet list already has association to provided Route Table | `bool` | `false` | no |
| <a name="input_PUBLIC_SUBNETS_IPV6_CIDR_BLOCK"></a> [PUBLIC\_SUBNETS\_IPV6\_CIDR\_BLOCK](#input\_PUBLIC\_SUBNETS\_IPV6\_CIDR\_BLOCK) | The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_IPV6_NATIVE"></a> [PUBLIC\_SUBNETS\_IPV6\_NATIVE](#input\_PUBLIC\_SUBNETS\_IPV6\_NATIVE) | Indicates whether to create an IPv6-only subnet. Default: false | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH](#input\_PUBLIC\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH) | Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer\_owned\_ipv4\_pool and outpost\_arn arguments must be specified when set to true. Default is false | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_OUTPOST_ARN"></a> [PUBLIC\_SUBNETS\_OUTPOST\_ARN](#input\_PUBLIC\_SUBNETS\_OUTPOST\_ARN) | The Amazon Resource Name (ARN) of the Outpost | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH](#input\_PUBLIC\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name | `any` | `null` | no |
| <a name="input_PUBLIC_SUBNET_ID_LIST"></a> [PUBLIC\_SUBNET\_ID\_LIST](#input\_PUBLIC\_SUBNET\_ID\_LIST) | Explicit Public Subnet ID List to overrule creation of Public Subnets | `list(string)` | `[]` | no |
| <a name="input_SECURITY_GROUP_EGRESS_CIDR_BLOCK"></a> [SECURITY\_GROUP\_EGRESS\_CIDR\_BLOCK](#input\_SECURITY\_GROUP\_EGRESS\_CIDR\_BLOCK) | CIDR Block for Security Group's egress rules. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_SECURITY_GROUP_EGRESS_FROM_PORT"></a> [SECURITY\_GROUP\_EGRESS\_FROM\_PORT](#input\_SECURITY\_GROUP\_EGRESS\_FROM\_PORT) | Starting of the port range for the Egress Security Group's rules | `number` | `0` | no |
| <a name="input_SECURITY_GROUP_EGRESS_RULES_PROTOCOL"></a> [SECURITY\_GROUP\_EGRESS\_RULES\_PROTOCOL](#input\_SECURITY\_GROUP\_EGRESS\_RULES\_PROTOCOL) | Protocol for Egress Security Group's rules | `string` | `"tcp"` | no |
| <a name="input_SECURITY_GROUP_EGRESS_TO_PORT"></a> [SECURITY\_GROUP\_EGRESS\_TO\_PORT](#input\_SECURITY\_GROUP\_EGRESS\_TO\_PORT) | Ending of the port range for the Egress Security Group's rules | `number` | `65535` | no |
| <a name="input_SECURITY_GROUP_INGRESS_CIDR_BLOCK"></a> [SECURITY\_GROUP\_INGRESS\_CIDR\_BLOCK](#input\_SECURITY\_GROUP\_INGRESS\_CIDR\_BLOCK) | CIDR Block for Security Group's ingress rules. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_SECURITY_GROUP_INGRESS_FROM_PORT"></a> [SECURITY\_GROUP\_INGRESS\_FROM\_PORT](#input\_SECURITY\_GROUP\_INGRESS\_FROM\_PORT) | Starting of the port range for the Ingress Security Group's rules | `number` | `0` | no |
| <a name="input_SECURITY_GROUP_INGRESS_RULES_PROTOCOL"></a> [SECURITY\_GROUP\_INGRESS\_RULES\_PROTOCOL](#input\_SECURITY\_GROUP\_INGRESS\_RULES\_PROTOCOL) | Protocol for Ingress Security Group's rules | `string` | `"tcp"` | no |
| <a name="input_SECURITY_GROUP_INGRESS_TO_PORT"></a> [SECURITY\_GROUP\_INGRESS\_TO\_PORT](#input\_SECURITY\_GROUP\_INGRESS\_TO\_PORT) | Ending of the port range for the Ingress Security Group's rules | `number` | `65535` | no |
| <a name="input_SECURITY_GROUP_NAME"></a> [SECURITY\_GROUP\_NAME](#input\_SECURITY\_GROUP\_NAME) | A list of virtual gateways for propagation | `any` | `null` | no |
| <a name="input_SECURITY_GROUP_NAME_PREFIX"></a> [SECURITY\_GROUP\_NAME\_PREFIX](#input\_SECURITY\_GROUP\_NAME\_PREFIX) | Creates a unique name beginning with the specified prefix. Conflicts with name | `any` | `null` | no |
| <a name="input_SECURITY_GROUP_REVOKE_RULES_ON_DELETE"></a> [SECURITY\_GROUP\_REVOKE\_RULES\_ON\_DELETE](#input\_SECURITY\_GROUP\_REVOKE\_RULES\_ON\_DELETE) | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself | `any` | `null` | no |
| <a name="input_TAGS"></a> [TAGS](#input\_TAGS) | Tag List | `map(string)` | `null` | no |
| <a name="input_VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK"></a> [VPC\_ASSIGN\_GENERATED\_IPV6\_CIDR\_BLOCK](#input\_VPC\_ASSIGN\_GENERATED\_IPV6\_CIDR\_BLOCK) | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC | `any` | `null` | no |
| <a name="input_VPC_CIDR"></a> [VPC\_CIDR](#input\_VPC\_CIDR) | The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4\_netmask\_length | `string` | `"10.192.0.0/16"` | no |
| <a name="input_VPC_DNS_HOSTNAMES"></a> [VPC\_DNS\_HOSTNAMES](#input\_VPC\_DNS\_HOSTNAMES) | To enable or disable dns\_hostnames on vpc | `bool` | `true` | no |
| <a name="input_VPC_DNS_SUPPORT"></a> [VPC\_DNS\_SUPPORT](#input\_VPC\_DNS\_SUPPORT) | To enable or disable dns\_suport on vpc | `bool` | `true` | no |
| <a name="input_VPC_ID"></a> [VPC\_ID](#input\_VPC\_ID) | Explicit VPC ID to overrule creation of default VPC | `string` | `""` | no |
| <a name="input_VPC_INSTANCE_TENENCY"></a> [VPC\_INSTANCE\_TENENCY](#input\_VPC\_INSTANCE\_TENENCY) | A tenancy option for instances launched into the VPC. Values can be 'default' or 'dedicated' | `any` | `null` | no |
| <a name="input_VPC_IPV4_IPAM_POOL_ID"></a> [VPC\_IPV4\_IPAM\_POOL\_ID](#input\_VPC\_IPV4\_IPAM\_POOL\_ID) | The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR | `any` | `null` | no |
| <a name="input_VPC_IPV4_NETMASK_LENGTH"></a> [VPC\_IPV4\_NETMASK\_LENGTH](#input\_VPC\_IPV4\_NETMASK\_LENGTH) | The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4\_ipam\_pool\_id | `any` | `null` | no |
| <a name="input_VPC_IPV6_CIDR_BLOCK"></a> [VPC\_IPV6\_CIDR\_BLOCK](#input\_VPC\_IPV6\_CIDR\_BLOCK) | IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6\_netmask\_length | `any` | `null` | no |
| <a name="input_VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP"></a> [VPC\_IPV6\_CIDR\_BLOCK\_NETWORK\_BORDER\_GROUP](#input\_VPC\_IPV6\_CIDR\_BLOCK\_NETWORK\_BORDER\_GROUP) | Can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones | `any` | `null` | no |
| <a name="input_VPC_IPV6_IPAM_POOL_ID"></a> [VPC\_IPV6\_IPAM\_POOL\_ID](#input\_VPC\_IPV6\_IPAM\_POOL\_ID) | IPAM Pool ID for a IPv6 pool. Conflicts with assign\_generated\_ipv6\_cidr\_block | `any` | `null` | no |
| <a name="input_VPC_IPV6_NETMASK_LENGTH"></a> [VPC\_IPV6\_NETMASK\_LENGTH](#input\_VPC\_IPV6\_NETMASK\_LENGTH) | Netmask length to request from IPAM Pool. Conflicts with ipv6\_cidr\_block. This can be omitted if IPAM pool as a allocation\_default\_netmask\_length set. Valid values: 56 | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_AZ_COUNT"></a> [AZ\_COUNT](#output\_AZ\_COUNT) | Fixed number of AZs to create resources |
| <a name="output_CREATE_SECURITY_GROUP"></a> [CREATE\_SECURITY\_GROUP](#output\_CREATE\_SECURITY\_GROUP) | To overwrite creation of Security Group |
| <a name="output_ELASTIC_IP_ALLOCATION_ID_LIST"></a> [ELASTIC\_IP\_ALLOCATION\_ID\_LIST](#output\_ELASTIC\_IP\_ALLOCATION\_ID\_LIST) | Explicit Elastic IP ID List to overrule creation of Elastic IPs |
| <a name="output_INTERNET_GATEWAY_ID"></a> [INTERNET\_GATEWAY\_ID](#output\_INTERNET\_GATEWAY\_ID) | Explicit Internet Gateway ID to overrule creation of default Internet Gateway |
| <a name="output_NAT_GATEWAYS_CONNECTIVITY_TYPE"></a> [NAT\_GATEWAYS\_CONNECTIVITY\_TYPE](#output\_NAT\_GATEWAYS\_CONNECTIVITY\_TYPE) | Connectivity type for the gateway. Valid values are private and public. Defaults to public |
| <a name="output_NAT_GATEWAY_ELASTIC_IP_VPC_ATTACHED"></a> [NAT\_GATEWAY\_ELASTIC\_IP\_VPC\_ATTACHED](#output\_NAT\_GATEWAY\_ELASTIC\_IP\_VPC\_ATTACHED) | To set as false for mapping public ip on launch |
| <a name="output_NAT_GATEWAY_ID_LIST"></a> [NAT\_GATEWAY\_ID\_LIST](#output\_NAT\_GATEWAY\_ID\_LIST) | Explicit NAT Gateway ID List to overrule creation of Nat Gateways |
| <a name="output_PRIVATE_ROUTE_TABLES_CIDR_BLOCK"></a> [PRIVATE\_ROUTE\_TABLES\_CIDR\_BLOCK](#output\_PRIVATE\_ROUTE\_TABLES\_CIDR\_BLOCK) | The CIDR block of the route |
| <a name="output_PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS"></a> [PRIVATE\_ROUTE\_TABLES\_PROPAGATING\_VGWS](#output\_PRIVATE\_ROUTE\_TABLES\_PROPAGATING\_VGWS) | A list of virtual gateways for propagation |
| <a name="output_PRIVATE_ROUTE_TABLE_ID_LIST"></a> [PRIVATE\_ROUTE\_TABLE\_ID\_LIST](#output\_PRIVATE\_ROUTE\_TABLE\_ID\_LIST) | Explicit Private Route Table ID List to overrule creation of Private Route Tables |
| <a name="output_PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION"></a> [PRIVATE\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION](#output\_PRIVATE\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false |
| <a name="output_PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID"></a> [PRIVATE\_SUBNETS\_AVAILABILITY\_ZONE\_ID](#output\_PRIVATE\_SUBNETS\_AVAILABILITY\_ZONE\_ID) | AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability\_zone instead |
| <a name="output_PRIVATE_SUBNETS_CIDR_BLOCK_LIST"></a> [PRIVATE\_SUBNETS\_CIDR\_BLOCK\_LIST](#output\_PRIVATE\_SUBNETS\_CIDR\_BLOCK\_LIST) | Explicit Private Subnet CIDR Block List to overrule creation pattern of Public Subnets |
| <a name="output_PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL"></a> [PRIVATE\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL](#output\_PRIVATE\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL) | The customer owned IPv4 address pool. Typically used with the map\_customer\_owned\_ip\_on\_launch argument. The outpost\_arn argument must be specified when configured |
| <a name="output_PRIVATE_SUBNETS_ENABLE_DNS64"></a> [PRIVATE\_SUBNETS\_ENABLE\_DNS64](#output\_PRIVATE\_SUBNETS\_ENABLE\_DNS64) | Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false |
| <a name="output_PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH](#output\_PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false |
| <a name="output_PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH](#output\_PRIVATE\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false |
| <a name="output_PRIVATE_SUBNETS_IPV6_CIDR_BLOCK"></a> [PRIVATE\_SUBNETS\_IPV6\_CIDR\_BLOCK](#output\_PRIVATE\_SUBNETS\_IPV6\_CIDR\_BLOCK) | The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length |
| <a name="output_PRIVATE_SUBNETS_IPV6_NATIVE"></a> [PRIVATE\_SUBNETS\_IPV6\_NATIVE](#output\_PRIVATE\_SUBNETS\_IPV6\_NATIVE) | Indicates whether to create an IPv6-only subnet. Default: false |
| <a name="output_PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH](#output\_PRIVATE\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH) | Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer\_owned\_ipv4\_pool and outpost\_arn arguments must be specified when set to true. Default is false |
| <a name="output_PRIVATE_SUBNETS_OUTPOST_ARN"></a> [PRIVATE\_SUBNETS\_OUTPOST\_ARN](#output\_PRIVATE\_SUBNETS\_OUTPOST\_ARN) | The Amazon Resource Name (ARN) of the Outpost |
| <a name="output_PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH"></a> [PRIVATE\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH](#output\_PRIVATE\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name |
| <a name="output_PRIVATE_SUBNET_ID_LIST"></a> [PRIVATE\_SUBNET\_ID\_LIST](#output\_PRIVATE\_SUBNET\_ID\_LIST) | Explicit Private Subnet ID List to overrule creation of Private Subnets |
| <a name="output_PROJECT_NAME"></a> [PROJECT\_NAME](#output\_PROJECT\_NAME) | The project name that will be prefixed to resource names |
| <a name="output_PUBLIC_ROUTE_TABLE_CIDR_BLOCK"></a> [PUBLIC\_ROUTE\_TABLE\_CIDR\_BLOCK](#output\_PUBLIC\_ROUTE\_TABLE\_CIDR\_BLOCK) | The CIDR block of the route |
| <a name="output_PUBLIC_ROUTE_TABLE_ID"></a> [PUBLIC\_ROUTE\_TABLE\_ID](#output\_PUBLIC\_ROUTE\_TABLE\_ID) | Explicit Public Route Table ID to overrule creation of Public Route Table |
| <a name="output_PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS"></a> [PUBLIC\_ROUTE\_TABLE\_PROPAGATING\_VGWS](#output\_PUBLIC\_ROUTE\_TABLE\_PROPAGATING\_VGWS) | A list of virtual gateways for propagation |
| <a name="output_PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION"></a> [PUBLIC\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION](#output\_PUBLIC\_SUBNETS\_ASSIGN\_IPV6\_ADDRESS\_ON\_CREATION) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false |
| <a name="output_PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID"></a> [PUBLIC\_SUBNETS\_AVAILABILITY\_ZONE\_ID](#output\_PUBLIC\_SUBNETS\_AVAILABILITY\_ZONE\_ID) | AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability\_zone instead |
| <a name="output_PUBLIC_SUBNETS_CIDR_BLOCK_LIST"></a> [PUBLIC\_SUBNETS\_CIDR\_BLOCK\_LIST](#output\_PUBLIC\_SUBNETS\_CIDR\_BLOCK\_LIST) | Explicit Public Subnet CIDR Block List to overrule creation pattern of Public Subnets |
| <a name="output_PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL"></a> [PUBLIC\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL](#output\_PUBLIC\_SUBNETS\_CUSTOMER\_OWNED\_IPV4\_POOL) | The customer owned IPv4 address pool. Typically used with the map\_customer\_owned\_ip\_on\_launch argument. The outpost\_arn argument must be specified when configured |
| <a name="output_PUBLIC_SUBNETS_ENABLE_DNS64"></a> [PUBLIC\_SUBNETS\_ENABLE\_DNS64](#output\_PUBLIC\_SUBNETS\_ENABLE\_DNS64) | Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false |
| <a name="output_PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH](#output\_PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_AAAA\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false |
| <a name="output_PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH](#output\_PUBLIC\_SUBNETS\_ENABLE\_RESOURCE\_NAME\_DNS\_A\_RECORD\_ON\_LAUNCH) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false |
| <a name="output_PUBLIC_SUBNETS_IPV6_CIDR_BLOCK"></a> [PUBLIC\_SUBNETS\_IPV6\_CIDR\_BLOCK](#output\_PUBLIC\_SUBNETS\_IPV6\_CIDR\_BLOCK) | The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length |
| <a name="output_PUBLIC_SUBNETS_IPV6_NATIVE"></a> [PUBLIC\_SUBNETS\_IPV6\_NATIVE](#output\_PUBLIC\_SUBNETS\_IPV6\_NATIVE) | Indicates whether to create an IPv6-only subnet. Default: false |
| <a name="output_PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH](#output\_PUBLIC\_SUBNETS\_MAP\_CUSTOMER\_OWNED\_IP\_ON\_LAUNCH) | Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer\_owned\_ipv4\_pool and outpost\_arn arguments must be specified when set to true. Default is false |
| <a name="output_PUBLIC_SUBNETS_OUTPOST_ARN"></a> [PUBLIC\_SUBNETS\_OUTPOST\_ARN](#output\_PUBLIC\_SUBNETS\_OUTPOST\_ARN) | The Amazon Resource Name (ARN) of the Outpost |
| <a name="output_PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH"></a> [PUBLIC\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH](#output\_PUBLIC\_SUBNETS\_PRIVATE\_DNS\_HOSTNAME\_TYPE\_ON\_LAUNCH) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name |
| <a name="output_PUBLIC_SUBNET_ID_LIST"></a> [PUBLIC\_SUBNET\_ID\_LIST](#output\_PUBLIC\_SUBNET\_ID\_LIST) | Explicit Public Subnet ID List to overrule creation of Public Subnets |
| <a name="output_SECURITY_GROUP_EGRESS_CIDR_BLOCK"></a> [SECURITY\_GROUP\_EGRESS\_CIDR\_BLOCK](#output\_SECURITY\_GROUP\_EGRESS\_CIDR\_BLOCK) | CIDR Block for Security Group's egress rules. |
| <a name="output_SECURITY_GROUP_EGRESS_FROM_PORT"></a> [SECURITY\_GROUP\_EGRESS\_FROM\_PORT](#output\_SECURITY\_GROUP\_EGRESS\_FROM\_PORT) | Starting of the port range for the Egress Security Group's rules |
| <a name="output_SECURITY_GROUP_EGRESS_RULES_PROTOCOL"></a> [SECURITY\_GROUP\_EGRESS\_RULES\_PROTOCOL](#output\_SECURITY\_GROUP\_EGRESS\_RULES\_PROTOCOL) | Protocol for Egress Security Group's rules |
| <a name="output_SECURITY_GROUP_EGRESS_TO_PORT"></a> [SECURITY\_GROUP\_EGRESS\_TO\_PORT](#output\_SECURITY\_GROUP\_EGRESS\_TO\_PORT) | Ending of the port range for the Egress Security Group's rules |
| <a name="output_SECURITY_GROUP_ID"></a> [SECURITY\_GROUP\_ID](#output\_SECURITY\_GROUP\_ID) | Explicit Security Group ID to use in other modules according to your needs |
| <a name="output_SECURITY_GROUP_INGRESS_CIDR_BLOCK"></a> [SECURITY\_GROUP\_INGRESS\_CIDR\_BLOCK](#output\_SECURITY\_GROUP\_INGRESS\_CIDR\_BLOCK) | CIDR Block for Security Group's ingress rules. |
| <a name="output_SECURITY_GROUP_INGRESS_FROM_PORT"></a> [SECURITY\_GROUP\_INGRESS\_FROM\_PORT](#output\_SECURITY\_GROUP\_INGRESS\_FROM\_PORT) | Starting of the port range for the Ingress Security Group's rules |
| <a name="output_SECURITY_GROUP_INGRESS_RULES_PROTOCOL"></a> [SECURITY\_GROUP\_INGRESS\_RULES\_PROTOCOL](#output\_SECURITY\_GROUP\_INGRESS\_RULES\_PROTOCOL) | Protocol for Ingress Security Group's rules |
| <a name="output_SECURITY_GROUP_INGRESS_TO_PORT"></a> [SECURITY\_GROUP\_INGRESS\_TO\_PORT](#output\_SECURITY\_GROUP\_INGRESS\_TO\_PORT) | Ending of the port range for the Ingress Security Group's rules |
| <a name="output_SECURITY_GROUP_NAME"></a> [SECURITY\_GROUP\_NAME](#output\_SECURITY\_GROUP\_NAME) | A list of virtual gateways for propagation |
| <a name="output_SECURITY_GROUP_NAME_PREFIX"></a> [SECURITY\_GROUP\_NAME\_PREFIX](#output\_SECURITY\_GROUP\_NAME\_PREFIX) | Creates a unique name beginning with the specified prefix. Conflicts with name |
| <a name="output_SECURITY_GROUP_REVOKE_RULES_ON_DELETE"></a> [SECURITY\_GROUP\_REVOKE\_RULES\_ON\_DELETE](#output\_SECURITY\_GROUP\_REVOKE\_RULES\_ON\_DELETE) | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself |
| <a name="output_VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK"></a> [VPC\_ASSIGN\_GENERATED\_IPV6\_CIDR\_BLOCK](#output\_VPC\_ASSIGN\_GENERATED\_IPV6\_CIDR\_BLOCK) | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC |
| <a name="output_VPC_CIDR"></a> [VPC\_CIDR](#output\_VPC\_CIDR) | The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4\_netmask\_length |
| <a name="output_VPC_DNS_HOSTNAMES"></a> [VPC\_DNS\_HOSTNAMES](#output\_VPC\_DNS\_HOSTNAMES) | To enable or disable dns\_hostnames on vpc |
| <a name="output_VPC_DNS_SUPPORT"></a> [VPC\_DNS\_SUPPORT](#output\_VPC\_DNS\_SUPPORT) | To enable or disable dns\_suport on vpc |
| <a name="output_VPC_ID"></a> [VPC\_ID](#output\_VPC\_ID) | Explicit VPC ID to overrule creation of default VPC |
| <a name="output_VPC_INSTANCE_TENENCY"></a> [VPC\_INSTANCE\_TENENCY](#output\_VPC\_INSTANCE\_TENENCY) | A tenancy option for instances launched into the VPC. Values can be 'default' or 'dedicated' |
| <a name="output_VPC_IPV4_IPAM_POOL_ID"></a> [VPC\_IPV4\_IPAM\_POOL\_ID](#output\_VPC\_IPV4\_IPAM\_POOL\_ID) | The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR |
| <a name="output_VPC_IPV4_NETMASK_LENGTH"></a> [VPC\_IPV4\_NETMASK\_LENGTH](#output\_VPC\_IPV4\_NETMASK\_LENGTH) | The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4\_ipam\_pool\_id |
| <a name="output_VPC_IPV6_CIDR_BLOCK"></a> [VPC\_IPV6\_CIDR\_BLOCK](#output\_VPC\_IPV6\_CIDR\_BLOCK) | IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6\_netmask\_length |
| <a name="output_VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP"></a> [VPC\_IPV6\_CIDR\_BLOCK\_NETWORK\_BORDER\_GROUP](#output\_VPC\_IPV6\_CIDR\_BLOCK\_NETWORK\_BORDER\_GROUP) | Can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones |
| <a name="output_VPC_IPV6_IPAM_POOL_ID"></a> [VPC\_IPV6\_IPAM\_POOL\_ID](#output\_VPC\_IPV6\_IPAM\_POOL\_ID) | IPAM Pool ID for a IPv6 pool. Conflicts with assign\_generated\_ipv6\_cidr\_block |
| <a name="output_VPC_IPV6_NETMASK_LENGTH"></a> [VPC\_IPV6\_NETMASK\_LENGTH](#output\_VPC\_IPV6\_NETMASK\_LENGTH) | Netmask length to request from IPAM Pool. Conflicts with ipv6\_cidr\_block. This can be omitted if IPAM pool as a allocation\_default\_netmask\_length set. Valid values: 56 |
<!-- END_TF_DOCS -->