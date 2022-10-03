# ###########################################################################################
# #                                     ESSENTIAL                                           #
# ###########################################################################################
output "PROJECT_NAME" {
  value       = var.PROJECT_NAME
  description = "The project name that will be prefixed to resource names"
}

# ###########################################################################################
# #                                     STRUCTURAL                                          #
# ###########################################################################################
output "AZ_COUNT" {
  value       = var.AZ_COUNT
  description = "Fixed number of AZs to create resources"
}

output "VPC_CIDR" {
  value       = var.VPC_CIDR
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
}

output "VPC_DNS_SUPPORT" {
  value       = var.VPC_DNS_SUPPORT
  description = "To enable or disable dns_suport on vpc"
}

output "VPC_DNS_HOSTNAMES" {
  value       = var.VPC_DNS_HOSTNAMES
  description = "To enable or disable dns_hostnames on vpc"
}

output "PUBLIC_ROUTE_TABLE_CIDR_BLOCK" {
  value       = var.PUBLIC_ROUTE_TABLE_CIDR_BLOCK
  description = "The CIDR block of the route"
}

output "PRIVATE_ROUTE_TABLES_CIDR_BLOCK" {
  value       = var.PRIVATE_ROUTE_TABLES_CIDR_BLOCK
  description = "The CIDR block of the route"
}

output "NAT_GATEWAY_ELASTIC_IP_VPC_ATTACHED" {
  value       = var.NAT_GATEWAY_ELASTIC_IP_VPC_ATTACHED
  description = "To set as false for mapping public ip on launch"
}

output "CREATE_SECURITY_GROUP" {
  value       = var.CREATE_SECURITY_GROUP
  description = "To overwrite creation of Security Group"
}

output "SECURITY_GROUP_INGRESS_FROM_PORT" {
  value       = var.SECURITY_GROUP_INGRESS_FROM_PORT
  description = "Starting of the port range for the Ingress Security Group's rules"
}

output "SECURITY_GROUP_INGRESS_TO_PORT" {
  value       = var.SECURITY_GROUP_INGRESS_TO_PORT
  description = "Ending of the port range for the Ingress Security Group's rules"
}

output "SECURITY_GROUP_INGRESS_RULES_PROTOCOL" {
  value       = var.SECURITY_GROUP_INGRESS_RULES_PROTOCOL
  description = "Protocol for Ingress Security Group's rules"
}

output "SECURITY_GROUP_INGRESS_CIDR_BLOCK" {
  value       = var.SECURITY_GROUP_INGRESS_CIDR_BLOCK
  description = "CIDR Block for Security Group's ingress rules."
}

output "SECURITY_GROUP_EGRESS_FROM_PORT" {
  value       = var.SECURITY_GROUP_EGRESS_FROM_PORT
  description = "Starting of the port range for the Egress Security Group's rules"
}

output "SECURITY_GROUP_EGRESS_TO_PORT" {
  value       = var.SECURITY_GROUP_EGRESS_TO_PORT
  description = "Ending of the port range for the Egress Security Group's rules"
}

output "SECURITY_GROUP_EGRESS_RULES_PROTOCOL" {
  value       = var.SECURITY_GROUP_EGRESS_RULES_PROTOCOL
  description = "Protocol for Egress Security Group's rules"
}

output "SECURITY_GROUP_EGRESS_CIDR_BLOCK" {
  value       = var.SECURITY_GROUP_EGRESS_CIDR_BLOCK
  description = "CIDR Block for Security Group's egress rules."
}

# ###########################################################################################
# #                                      OPTIONAL                                           #
# ###########################################################################################
output "VPC_INSTANCE_TENENCY" {
  value       = var.VPC_INSTANCE_TENENCY
  description = "A tenancy option for instances launched into the VPC. Values can be 'default' or 'dedicated'"
}

output "VPC_IPV4_IPAM_POOL_ID" {
  value       = var.VPC_IPV4_IPAM_POOL_ID
  description = "The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR"
}

output "VPC_IPV4_NETMASK_LENGTH" {
  value       = var.VPC_IPV4_NETMASK_LENGTH
  description = "The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
}

output "VPC_IPV6_CIDR_BLOCK" {
  value       = var.VPC_IPV6_CIDR_BLOCK
  description = "IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length"
}

output "VPC_IPV6_IPAM_POOL_ID" {
  value       = var.VPC_IPV6_IPAM_POOL_ID
  description = "IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block"
}

output "VPC_IPV6_NETMASK_LENGTH" {
  value       = var.VPC_IPV6_NETMASK_LENGTH
  description = "Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values: 56"
}

output "VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP" {
  value       = var.VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP
  description = "Can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones"
}

output "VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK" {
  value       = var.VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC"
}

output "PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION" {
  value       = var.PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
}

output "PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID" {
  value       = var.PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID
  description = "AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead"
}

output "PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL" {
  value       = var.PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL
  description = "The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured"
}

output "PUBLIC_SUBNETS_ENABLE_DNS64" {
  value       = var.PUBLIC_SUBNETS_ENABLE_DNS64
  description = " Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false"
}

output "PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH" {
  value       = var.PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false"
}

output "PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH" {
  value       = var.PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false"
}

output "PUBLIC_SUBNETS_IPV6_CIDR_BLOCK" {
  value       = var.PUBLIC_SUBNETS_IPV6_CIDR_BLOCK
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length"
}

output "PUBLIC_SUBNETS_IPV6_NATIVE" {
  value       = var.PUBLIC_SUBNETS_IPV6_NATIVE
  description = " Indicates whether to create an IPv6-only subnet. Default: false"
}

output "PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH" {
  value       = var.PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false"
}

output "PUBLIC_SUBNETS_OUTPOST_ARN" {
  value       = var.PUBLIC_SUBNETS_OUTPOST_ARN
  description = "The Amazon Resource Name (ARN) of the Outpost"
}

output "PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH" {
  value       = var.PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name"
}

output "PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION" {
  value       = var.PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
}

output "PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID" {
  value       = var.PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID
  description = "AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead"
}

output "PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL" {
  value       = var.PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL
  description = "The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured"
}

output "PRIVATE_SUBNETS_ENABLE_DNS64" {
  value       = var.PRIVATE_SUBNETS_ENABLE_DNS64
  description = " Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false"
}

output "PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH" {
  value       = var.PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false"
}

output "PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH" {
  value       = var.PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false"
}

output "PRIVATE_SUBNETS_IPV6_CIDR_BLOCK" {
  value       = var.PRIVATE_SUBNETS_IPV6_CIDR_BLOCK
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length"
}

output "PRIVATE_SUBNETS_IPV6_NATIVE" {
  value       = var.PRIVATE_SUBNETS_IPV6_NATIVE
  description = " Indicates whether to create an IPv6-only subnet. Default: false"
}

output "PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH" {
  value       = var.PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false"
}

output "PRIVATE_SUBNETS_OUTPOST_ARN" {
  value       = var.PRIVATE_SUBNETS_OUTPOST_ARN
  description = "The Amazon Resource Name (ARN) of the Outpost"
}

output "PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH" {
  value       = var.PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name"
}

output "NAT_GATEWAYS_CONNECTIVITY_TYPE" {
  value       = var.NAT_GATEWAYS_CONNECTIVITY_TYPE
  description = "Connectivity type for the gateway. Valid values are private and public. Defaults to public"
}

output "PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS" {
  value       = var.PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS
  description = "A list of virtual gateways for propagation"
}

output "PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS" {
  value       = var.PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS
  description = "A list of virtual gateways for propagation"
}

output "SECURITY_GROUP_NAME" {
  value       = var.SECURITY_GROUP_NAME
  description = "A list of virtual gateways for propagation"
}

output "SECURITY_GROUP_NAME_PREFIX" {
  value       = var.SECURITY_GROUP_NAME_PREFIX
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
}

output "SECURITY_GROUP_REVOKE_RULES_ON_DELETE" {
  value       = var.SECURITY_GROUP_REVOKE_RULES_ON_DELETE
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself"
}


# ###########################################################################################
# #                                      RESOURCE                                           #
# ###########################################################################################
output "VPC_ID" {
  value       = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  description = "Explicit VPC ID to overrule creation of default VPC"
}

output "INTERNET_GATEWAY_ID" {
  value       = var.INTERNET_GATEWAY_ID != "" ? var.INTERNET_GATEWAY_ID : join("", aws_internet_gateway.internet_gateway.*.id)
  description = "Explicit Internet Gateway ID to overrule creation of default Internet Gateway"
}

output "PUBLIC_SUBNETS_CIDR_BLOCK_LIST" {
  value       = var.PUBLIC_SUBNETS_CIDR_BLOCK_LIST != "" ? var.PUBLIC_SUBNETS_CIDR_BLOCK_LIST : aws_subnet.public_subnets[*].cidr_block
  description = "Explicit Public Subnet CIDR Block List to overrule creation pattern of Public Subnets"
}

output "PRIVATE_SUBNETS_CIDR_BLOCK_LIST" {
  value       = var.PRIVATE_SUBNETS_CIDR_BLOCK_LIST != "" ? var.PRIVATE_SUBNETS_CIDR_BLOCK_LIST : aws_subnet.private_subnets[*].cidr_block
  description = "Explicit Private Subnet CIDR Block List to overrule creation pattern of Public Subnets"
}

output "PUBLIC_SUBNET_ID_LIST" {
  value       = var.PUBLIC_SUBNET_ID_LIST != "" ? var.PUBLIC_SUBNET_ID_LIST : aws_subnet.public_subnets[*].id
  description = "Explicit Public Subnet ID List to overrule creation of Public Subnets"
}

output "PRIVATE_SUBNET_ID_LIST" {
  value       = var.PRIVATE_SUBNET_ID_LIST != "" ? var.PRIVATE_SUBNET_ID_LIST : aws_subnet.private_subnets[*].id
  description = "Explicit Private Subnet ID List to overrule creation of Private Subnets"
}

output "ELASTIC_IP_ALLOCATION_ID_LIST" {
  value       = var.ELASTIC_IP_ALLOCATION_ID_LIST != "" ? var.ELASTIC_IP_ALLOCATION_ID_LIST : aws_eip.elastic_ips[*].id
  description = "Explicit Elastic IP ID List to overrule creation of Elastic IPs"
}

output "NAT_GATEWAY_ID_LIST" {
  value       = var.NAT_GATEWAY_ID_LIST != "" ? var.NAT_GATEWAY_ID_LIST : aws_nat_gateway.nat_gateways[*].id
  description = "Explicit NAT Gateway ID List to overrule creation of Nat Gateways"
}

output "PUBLIC_ROUTE_TABLE_ID" {
  value       = var.PUBLIC_ROUTE_TABLE_ID != "" ? var.PUBLIC_ROUTE_TABLE_ID : join("", aws_route_table.public_route_table.*.id)
  description = "Explicit Public Route Table ID to overrule creation of Public Route Table"
}

output "PRIVATE_ROUTE_TABLE_ID_LIST" {
  value       = var.PRIVATE_ROUTE_TABLE_ID_LIST != "" ? var.PRIVATE_ROUTE_TABLE_ID_LIST : aws_route_table.private_route_tables[*].id
  description = "Explicit Private Route Table ID List to overrule creation of Private Route Tables"
}

output "SECURITY_GROUP_ID" {
  value       = var.CREATE_SECURITY_GROUP ? join("", aws_security_group.security_group.*.id) : null
  description = "Explicit Security Group ID to use in other modules according to your needs"
}