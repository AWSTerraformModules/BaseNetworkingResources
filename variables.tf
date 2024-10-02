# ###########################################################################################
# #                                     ESSENTIAL                                           #
# ###########################################################################################
variable "PROJECT_NAME" {
  description = "The project name that will be prefixed to resource names"
  type        = string
}

# ###########################################################################################
# #                                     STRUCTURAL                                          #
# ###########################################################################################
variable "AZ_COUNT" {
  type        = number
  description = "Fixed number of AZs to create resources"
  default     = 0
}

variable "VPC_ID" {
  type        = string
  description = "Explicit VPC ID to overrule creation of default VPC"
  default     = ""
}

variable "VPC_MAIN_ROUTE_TABLE_ID" {
  type        = string
  description = "Used to define a route on the main route table of the explicit VPC given"
  default     = ""
}

variable "VPC_CIDR" {
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
  type        = string
  default     = "10.192.0.0/16"
}

variable "VPC_DNS_SUPPORT" {
  type        = bool
  description = "To enable or disable dns_suport on vpc"
  default     = true
}

variable "VPC_DNS_HOSTNAMES" {
  type        = bool
  description = "To enable or disable dns_hostnames on vpc"
  default     = true
}

variable "CREATE_CUSTOM_PUBLIC_SUBNET_ACL" {
  type        = bool
  description = "To define if a Custom Network ACL will be created for association with Public Subnet(s)"
  default     = false
}

variable "CREATE_CUSTOM_PRIVATE_SUBNET_ACL" {
  type        = bool
  description = "To define if a Custom Network ACL will be created for association with Private Subnet(s)"
  default     = false
}

variable "PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST" {
  type        = list(any)
  description = "Map with argument/values for Network ACL Rules Configuration"
  default     = []
}

variable "PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST" {
  type        = list(any)
  description = "Map with argument/values for Network ACL Rules Configuration"
  default     = []
}

variable "PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST" {
  type        = list(any)
  description = "Map with argument/values for Network ACL Rules Configuration"
  default     = []
}

variable "PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST" {
  type        = list(any)
  description = "Map with argument/values for Network ACL Rules Configuration"
  default     = []
}

variable "INTERNET_GATEWAY_ID" {
  type        = string
  description = "Explicit Internet Gateway ID to overrule creation of default Internet Gateway"
  default     = ""
}

variable "PUBLIC_SUBNET_ID_LIST" {
  type        = list(string)
  description = "Explicit Public Subnet ID List to overrule creation of Public Subnets"
  default     = []
}

variable "CREATE_PUBLIC_SUBNET" {
  type        = bool
  description = "To define if a Public Subnet will be created in conjunction with the az_count"
  default     = true
}

variable "PUBLIC_SUBNETS_CIDR_BLOCK_LIST" {
  type        = list(string)
  description = "Explicit Public Subnet CIDR Block List to overrule creation pattern of Public Subnets. If filled out, this attribute needs to have as many items as the amount of AZs in the selected region if var \"AZ_COUNT\" is not set, or with the same amount of var \"AZ_COUNT\" otherwise"
  default     = []
}

variable "PRIVATE_SUBNET_ID_LIST" {
  type        = list(string)
  description = "Explicit Private Subnet ID List to overrule creation of Private Subnets"
  default     = []
}

variable "CREATE_PRIVATE_SUBNET" {
  type        = bool
  description = "To define if a Private Subnet will be created in conjunction with the az_count"
  default     = true
}

variable "PRIVATE_SUBNETS_CIDR_BLOCK_LIST" {
  type        = list(string)
  description = "Explicit Private Subnet CIDR Block List to overrule creation pattern of Public Subnets. If filled out, this attribute needs to have as many items as the amount of AZs in the selected region if var \"AZ_COUNT\" is not set, or with the same amount of var \"AZ_COUNT\" otherwise"
  default     = []
}

variable "MAIN_ROUTE_TABLE_CIDR_BLOCK" {
  description = "The CIDR block of the main route table automatically created with the VPC"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ELASTIC_IP_ALLOCATION_ID_LIST" {
  type        = list(string)
  description = "Explicit Elastic IP ID List to overrule creation of Elastic IPs"
  default     = []
}

variable "NAT_GATEWAY_ID_LIST" {
  type        = list(string)
  description = "Explicit NAT Gateway ID List to overrule creation of Nat Gateways"
  default     = []
}

variable "NAT_GATEWAY_ELASTIC_IP_DOMAIN" {
  type        = string
  description = "Indicates if this EIP is for use in VPC"
  default     = "vpc"
}

variable "PUBLIC_ROUTE_TABLE_ID" {
  type        = string
  description = "Explicit Public Route Table ID to overrule creation of Public Route Table"
  default     = ""
}

variable "PUBLIC_ROUTE_TABLE_CIDR_BLOCK" {
  description = "The CIDR block of the route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "PRIVATE_ROUTE_TABLE_ID_LIST" {
  type        = list(string)
  description = "Explicit Private Route Table ID List to overrule creation of Private Route Tables"
  default     = []
}

variable "PRIVATE_ROUTE_TABLES_CIDR_BLOCK" {
  description = "The CIDR block of the route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "PUBLIC_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION" {
  type        = bool
  description = "To define that provided public subnet list already has association to provided Route Table"
  default     = false
}

variable "PRIVATE_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION" {
  type        = bool
  description = "To define that provided private subnet list already has association to provided Route Table"
  default     = false
}

variable "CREATE_SECURITY_GROUP" {
  type        = bool
  description = "To overwrite creation of Security Group"
  default     = true
}

variable "SECURITY_GROUP_INGRESS_FROM_PORT" {
  description = "Starting of the port range for the Ingress Security Group's rules"
  type        = number
  default     = 0
}

variable "SECURITY_GROUP_INGRESS_TO_PORT" {
  description = "Ending of the port range for the Ingress Security Group's rules"
  type        = number
  default     = 65535
}

variable "SECURITY_GROUP_INGRESS_RULES_PROTOCOL" {
  description = "Protocol for Ingress Security Group's rules"
  type        = string
  default     = "tcp"
}

variable "SECURITY_GROUP_INGRESS_CIDR_BLOCK" {
  description = "CIDR Block for Security Group's ingress rules."
  type        = string
  default     = "0.0.0.0/0"
}

variable "SECURITY_GROUP_EGRESS_FROM_PORT" {
  description = "Starting of the port range for the Egress Security Group's rules"
  type        = number
  default     = 0
}

variable "SECURITY_GROUP_EGRESS_TO_PORT" {
  description = "Ending of the port range for the Egress Security Group's rules"
  type        = number
  default     = 65535
}

variable "SECURITY_GROUP_EGRESS_RULES_PROTOCOL" {
  description = "Protocol for Egress Security Group's rules"
  type        = string
  default     = "tcp"
}

variable "SECURITY_GROUP_EGRESS_CIDR_BLOCK" {
  description = "CIDR Block for Security Group's egress rules."
  type        = string
  default     = "0.0.0.0/0"
}

variable "TAGS" {
  type        = map(string)
  description = "Tag List"
  default     = null
}

# ###########################################################################################
# #                                      OPTIONAL                                           #
# ###########################################################################################
variable "VPC_INSTANCE_TENENCY" {
  description = "A tenancy option for instances launched into the VPC. Values can be 'default' or 'dedicated'"
  default     = null
}

variable "VPC_IPV4_IPAM_POOL_ID" {
  description = "The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR"
  default     = null
}

variable "VPC_IPV4_NETMASK_LENGTH" {
  description = "The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  default     = null
}

variable "VPC_IPV6_CIDR_BLOCK" {
  description = "IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length"
  default     = null
}

variable "VPC_IPV6_IPAM_POOL_ID" {
  description = "IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block"
  default     = null
}

variable "VPC_IPV6_NETMASK_LENGTH" {
  description = "Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values: 56"
  default     = null
}

variable "VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP" {
  description = "Can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones"
  default     = null
}

variable "VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC"
  default     = null
}

variable "PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
  default     = null
}

variable "PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID" {
  description = "AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead"
  default     = null
}

variable "PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL" {
  description = "The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured"
  default     = null
}

variable "PUBLIC_SUBNETS_ENABLE_DNS64" {
  description = " Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false"
  default     = null
}

variable "PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false"
  default     = null
}

variable "PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false"
  default     = null
}

variable "PUBLIC_SUBNETS_IPV6_CIDR_BLOCK" {
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length"
  default     = null
}

variable "PUBLIC_SUBNETS_IPV6_NATIVE" {
  description = " Indicates whether to create an IPv6-only subnet. Default: false"
  default     = null
}

variable "PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH" {
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false"
  default     = null
}

variable "PUBLIC_SUBNETS_OUTPOST_ARN" {
  description = "The Amazon Resource Name (ARN) of the Outpost"
  default     = null
}

variable "PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH" {
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name"
  default     = null
}

variable "PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
  default     = null
}

variable "PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID" {
  description = "AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead"
  default     = null
}

variable "PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL" {
  description = "The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured"
  default     = null
}

variable "PRIVATE_SUBNETS_ENABLE_DNS64" {
  description = " Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false"
  default     = null
}

variable "PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false"
  default     = null
}

variable "PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false"
  default     = null
}

variable "PRIVATE_SUBNETS_IPV6_CIDR_BLOCK" {
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length"
  default     = null
}

variable "PRIVATE_SUBNETS_IPV6_NATIVE" {
  description = " Indicates whether to create an IPv6-only subnet. Default: false"
  default     = null
}

variable "PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH" {
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false"
  default     = null
}

variable "PRIVATE_SUBNETS_OUTPOST_ARN" {
  description = "The Amazon Resource Name (ARN) of the Outpost"
  default     = null
}

variable "PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH" {
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name"
  default     = null
}

variable "ELASTIC_IPS_ADDRESS" {
  description = "IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs"
  default     = null
}

variable "ELASTIC_IPS_ASSOCIATE_WITH_PRIVATE_IP" {
  description = "User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address"
  default     = null
}

variable "ELASTIC_IPS_CUSTOMER_OWNED_IPV4_POOL" {
  description = "ID of a customer-owned address pool"
  default     = null
}

variable "ELASTIC_IPS_INSTANCE" {
  description = "EC2 instance ID"
  default     = null
}

variable "ELASTIC_IPS_NETWORK_BORDER_GROUP" {
  description = "Location from which the IP address is advertised. Use this parameter to limit the address to this location"
  default     = null
}

variable "ELASTIC_IPS_NETWORK_INTERFACE" {
  description = "Network interface ID to associate with"
  default     = null
}

variable "ELASTIC_IPS_PUBLIC_IPV4_POOL" {
  description = "EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs"
  default     = null
}

variable "NAT_GATEWAYS_CONNECTIVITY_TYPE" {
  description = "Connectivity type for the gateway. Valid values are private and public. Defaults to public"
  default     = null
}

variable "PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS" {
  description = "A list of virtual gateways for propagation"
  default     = null
}

variable "PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS" {
  description = "A list of virtual gateways for propagation"
  default     = null
}

variable "SECURITY_GROUP_NAME" {
  description = "A list of virtual gateways for propagation"
  default     = null
}

variable "SECURITY_GROUP_NAME_PREFIX" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  default     = null
}

variable "SECURITY_GROUP_REVOKE_RULES_ON_DELETE" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself"
  default     = null
}