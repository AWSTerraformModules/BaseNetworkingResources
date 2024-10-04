data "aws_availability_zones" "available_az" {}

resource "aws_vpc" "vpc" {
  count                                = var.VPC_ID != "" ? 0 : 1
  cidr_block                           = var.VPC_CIDR
  enable_dns_support                   = var.VPC_DNS_SUPPORT
  enable_dns_hostnames                 = var.VPC_DNS_HOSTNAMES
  tags                                 = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} VPC" })}" : { Name = "${var.PROJECT_NAME} VPC" }
  instance_tenancy                     = var.VPC_INSTANCE_TENENCY
  ipv4_ipam_pool_id                    = var.VPC_IPV4_IPAM_POOL_ID
  ipv4_netmask_length                  = var.VPC_IPV4_NETMASK_LENGTH
  ipv6_cidr_block                      = var.VPC_IPV6_CIDR_BLOCK
  ipv6_ipam_pool_id                    = var.VPC_IPV6_IPAM_POOL_ID
  ipv6_netmask_length                  = var.VPC_IPV6_NETMASK_LENGTH
  ipv6_cidr_block_network_border_group = var.VPC_IPV6_CIDR_BLOCK_NETWORK_BORDER_GROUP
  assign_generated_ipv6_cidr_block     = var.VPC_ASSIGN_GENERATED_IPV6_CIDR_BLOCK
}

resource "aws_network_acl" "public_subnet_acl_list" {
  count  = var.CREATE_CUSTOM_PUBLIC_SUBNET_ACL == false ? 0 : length(var.PUBLIC_SUBNET_ID_LIST) > 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(aws_subnet.public_subnets[*].id)
  vpc_id = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  tags   = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Public Subnet Network ACL" })}" : { Name = "${var.PROJECT_NAME} Public Subnet Network ACL" }
}

resource "aws_network_acl" "private_subnet_acl_list" {
  count  = var.CREATE_CUSTOM_PRIVATE_SUBNET_ACL == false ? 0 : length(var.PRIVATE_SUBNET_ID_LIST) > 0 ? length(var.PRIVATE_SUBNET_ID_LIST) : length(aws_subnet.private_subnets[*].id)
  vpc_id = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  tags   = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Private Subnet Network ACL" })}" : { Name = "${var.PROJECT_NAME} Private Subnet Network ACL" }
}

resource "aws_network_acl_association" "public_subnet_acl_list_association" {
  count          = var.CREATE_CUSTOM_PUBLIC_SUBNET_ACL == false ? 0 : length(var.PUBLIC_SUBNET_ID_LIST) > 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(aws_subnet.public_subnets[*].id)
  network_acl_id = aws_network_acl.public_subnet_acl_list[count.index].id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

resource "aws_network_acl_association" "private_subnet_acl_list_association" {
  count          = var.CREATE_CUSTOM_PRIVATE_SUBNET_ACL == false ? 0 : length(var.PRIVATE_SUBNET_ID_LIST) > 0 ? length(var.PRIVATE_SUBNET_ID_LIST) : length(aws_subnet.private_subnets[*].id)
  network_acl_id = aws_network_acl.private_subnet_acl_list[count.index].id
  subnet_id      = aws_subnet.private_subnets[count.index].id
}

resource "aws_network_acl_rule" "public_subnet_acl_list_rule_ingress" {
  count          = var.CREATE_CUSTOM_PUBLIC_SUBNET_ACL == false ? 0 : length(var.PUBLIC_SUBNET_ID_LIST) > 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(aws_subnet.public_subnets[*].id)
  network_acl_id = aws_network_acl.public_subnet_acl_list[count.index].id
  rule_number    = var.PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST[count.index].rule_number
  egress         = var.PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST[count.index].egress
  protocol       = var.PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST[count.index].protocol
  rule_action    = var.PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST[count.index].rule_action
  cidr_block     = var.PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST[count.index].cidr_block
  from_port      = var.PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST[count.index].from_port
  to_port        = var.PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST[count.index].to_port
}

resource "aws_network_acl_rule" "public_subnet_acl_list_rule_egress" {
  count          = var.CREATE_CUSTOM_PUBLIC_SUBNET_ACL == false ? 0 : length(var.PUBLIC_SUBNET_ID_LIST) > 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(aws_subnet.public_subnets[*].id)
  network_acl_id = aws_network_acl.public_subnet_acl_list[count.index].id
  rule_number    = var.PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST[count.index].rule_number
  egress         = var.PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST[count.index].egress
  protocol       = var.PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST[count.index].protocol
  rule_action    = var.PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST[count.index].rule_action
  cidr_block     = var.PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST[count.index].cidr_block
  from_port      = var.PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST[count.index].from_port
  to_port        = var.PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST[count.index].to_port
}

resource "aws_network_acl_rule" "private_subnet_acl_list_rule_ingress" {
  count          = var.CREATE_CUSTOM_PRIVATE_SUBNET_ACL == false ? 0 : length(var.PRIVATE_SUBNET_ID_LIST) > 0 ? length(var.PRIVATE_SUBNET_ID_LIST) : length(aws_subnet.private_subnets[*].id)
  network_acl_id = aws_network_acl.private_subnet_acl_list[count.index].id
  rule_number    = var.PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST[count.index].rule_number
  egress         = var.PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST[count.index].egress
  protocol       = var.PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST[count.index].protocol
  rule_action    = var.PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST[count.index].rule_action
  cidr_block     = var.PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST[count.index].cidr_block
  from_port      = var.PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST[count.index].from_port
  to_port        = var.PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST[count.index].to_port
}

resource "aws_network_acl_rule" "private_subnet_acl_list_rule_egress" {
  count          = var.CREATE_CUSTOM_PRIVATE_SUBNET_ACL == false ? 0 : length(var.PRIVATE_SUBNET_ID_LIST) > 0 ? length(var.PRIVATE_SUBNET_ID_LIST) : length(aws_subnet.private_subnets[*].id)
  network_acl_id = aws_network_acl.private_subnet_acl_list[count.index].id
  rule_number    = var.PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST[count.index].rule_number
  egress         = var.PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST[count.index].egress
  protocol       = var.PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST[count.index].protocol
  rule_action    = var.PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST[count.index].rule_action
  cidr_block     = var.PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST[count.index].cidr_block
  from_port      = var.PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST[count.index].from_port
  to_port        = var.PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST[count.index].to_port
}

resource "aws_internet_gateway" "internet_gateway" {
  count  = var.INTERNET_GATEWAY_ID != "" ? 0 : 1
  vpc_id = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  tags   = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Internet Gateway" })}" : { Name = "${var.PROJECT_NAME} Internet Gateway" }
}

resource "aws_subnet" "public_subnets" {
  count                                          = var.AZ_COUNT == 0 && length(var.PUBLIC_SUBNET_ID_LIST) == 0 ? length(data.aws_availability_zones.available_az.names) : var.AZ_COUNT != 0 && length(var.PUBLIC_SUBNET_ID_LIST) == 0 ? var.AZ_COUNT : var.AZ_COUNT != 0 && var.CREATE_PUBLIC_SUBNET == true ? var.AZ_COUNT : 0
  vpc_id                                         = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  cidr_block                                     = length(var.PUBLIC_SUBNETS_CIDR_BLOCK_LIST) > 0 ? element(var.PUBLIC_SUBNETS_CIDR_BLOCK_LIST, count.index) : "10.192.${10 + count.index}.0/24"
  availability_zone                              = data.aws_availability_zones.available_az.names[count.index]
  map_public_ip_on_launch                        = true
  tags                                           = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Public Subnet ${count.index + 1}" })}" : { Name = "${var.PROJECT_NAME} Public Subnet ${count.index + 1}" }
  assign_ipv6_address_on_creation                = var.PUBLIC_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION
  availability_zone_id                           = var.PUBLIC_SUBNETS_AVAILABILITY_ZONE_ID
  customer_owned_ipv4_pool                       = var.PUBLIC_SUBNETS_CUSTOMER_OWNED_IPV4_POOL
  enable_dns64                                   = var.PUBLIC_SUBNETS_ENABLE_DNS64
  enable_resource_name_dns_aaaa_record_on_launch = var.PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH
  enable_resource_name_dns_a_record_on_launch    = var.PUBLIC_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH
  ipv6_cidr_block                                = var.PUBLIC_SUBNETS_IPV6_CIDR_BLOCK
  ipv6_native                                    = var.PUBLIC_SUBNETS_IPV6_NATIVE
  map_customer_owned_ip_on_launch                = var.PUBLIC_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH
  outpost_arn                                    = var.PUBLIC_SUBNETS_OUTPOST_ARN
  private_dns_hostname_type_on_launch            = var.PUBLIC_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH
}

resource "aws_subnet" "private_subnets" {
  count                                          = var.AZ_COUNT == 0 && length(var.PRIVATE_SUBNET_ID_LIST) == 0 ? length(data.aws_availability_zones.available_az.names) : var.AZ_COUNT != 0 && length(var.PRIVATE_SUBNET_ID_LIST) == 0 ? var.AZ_COUNT : var.AZ_COUNT != 0 && var.CREATE_PRIVATE_SUBNET == true ? var.AZ_COUNT : 0
  vpc_id                                         = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  cidr_block                                     = length(var.PRIVATE_SUBNETS_CIDR_BLOCK_LIST) > 0 ? element(var.PRIVATE_SUBNETS_CIDR_BLOCK_LIST, count.index) : "10.192.${20 + count.index}.0/24"
  availability_zone                              = data.aws_availability_zones.available_az.names[count.index]
  map_public_ip_on_launch                        = false
  tags                                           = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Private Subnet ${count.index + 1}" })}" : { Name = "${var.PROJECT_NAME} Private Subnet ${count.index + 1}" }
  assign_ipv6_address_on_creation                = var.PRIVATE_SUBNETS_ASSIGN_IPV6_ADDRESS_ON_CREATION
  availability_zone_id                           = var.PRIVATE_SUBNETS_AVAILABILITY_ZONE_ID
  customer_owned_ipv4_pool                       = var.PRIVATE_SUBNETS_CUSTOMER_OWNED_IPV4_POOL
  enable_dns64                                   = var.PRIVATE_SUBNETS_ENABLE_DNS64
  enable_resource_name_dns_aaaa_record_on_launch = var.PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_AAAA_RECORD_ON_LAUNCH
  enable_resource_name_dns_a_record_on_launch    = var.PRIVATE_SUBNETS_ENABLE_RESOURCE_NAME_DNS_A_RECORD_ON_LAUNCH
  ipv6_cidr_block                                = var.PRIVATE_SUBNETS_IPV6_CIDR_BLOCK
  ipv6_native                                    = var.PRIVATE_SUBNETS_IPV6_NATIVE
  map_customer_owned_ip_on_launch                = var.PRIVATE_SUBNETS_MAP_CUSTOMER_OWNED_IP_ON_LAUNCH
  outpost_arn                                    = var.PRIVATE_SUBNETS_OUTPOST_ARN
  private_dns_hostname_type_on_launch            = var.PRIVATE_SUBNETS_PRIVATE_DNS_HOSTNAME_TYPE_ON_LAUNCH
}

resource "aws_route" "main_route_table_route" {
  count  = var.CREATE_MAIN_TABLE_ROUTE == false ? 0 : 1
  route_table_id         = var.VPC_MAIN_ROUTE_TABLE_ID != "" ? var.VPC_MAIN_ROUTE_TABLE_ID : join("", aws_vpc.vpc.*.main_route_table_id)
  destination_cidr_block = var.MAIN_ROUTE_TABLE_CIDR_BLOCK
  gateway_id             = var.INTERNET_GATEWAY_ID != "" ? var.INTERNET_GATEWAY_ID : join("", aws_internet_gateway.internet_gateway.*.id)
}

resource "aws_eip" "elastic_ips" {
  count                     = length(var.PUBLIC_SUBNET_ID_LIST) > 0 && length(var.ELASTIC_IP_ALLOCATION_ID_LIST) == 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(var.PUBLIC_SUBNET_ID_LIST) == 0 && length(var.ELASTIC_IP_ALLOCATION_ID_LIST) == 0 ? length(aws_subnet.public_subnets.*.id) : 0
  domain                    = var.NAT_GATEWAY_ELASTIC_IP_DOMAIN
  tags                      = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Elastic IP ${count.index + 1}" })}" : { Name = "${var.PROJECT_NAME} Elastic IP ${count.index + 1}" }
  address                   = var.ELASTIC_IPS_ADDRESS
  associate_with_private_ip = var.ELASTIC_IPS_ASSOCIATE_WITH_PRIVATE_IP
  customer_owned_ipv4_pool  = var.ELASTIC_IPS_CUSTOMER_OWNED_IPV4_POOL
  instance                  = var.ELASTIC_IPS_INSTANCE
  network_border_group      = var.ELASTIC_IPS_NETWORK_BORDER_GROUP
  network_interface         = var.ELASTIC_IPS_NETWORK_INTERFACE
  public_ipv4_pool          = var.ELASTIC_IPS_PUBLIC_IPV4_POOL
}

resource "aws_nat_gateway" "nat_gateways" {
  count             = length(var.PUBLIC_SUBNET_ID_LIST) > 0 && length(var.NAT_GATEWAY_ID_LIST) == 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(var.PUBLIC_SUBNET_ID_LIST) == 0 && length(var.NAT_GATEWAY_ID_LIST) == 0 ? length(aws_subnet.public_subnets.*.id) : 0
  allocation_id     = length(var.ELASTIC_IP_ALLOCATION_ID_LIST) > 0 ? element(var.ELASTIC_IP_ALLOCATION_ID_LIST, count.index) : aws_eip.elastic_ips[count.index].id
  subnet_id         = length(var.PUBLIC_SUBNET_ID_LIST) > 0 ? element(var.PUBLIC_SUBNET_ID_LIST, count.index) : aws_subnet.public_subnets[count.index].id
  tags              = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Nat Gateway ${count.index + 1}" })}" : { Name = "${var.PROJECT_NAME} Nat Gateway ${count.index + 1}" }
  depends_on        = [aws_internet_gateway.internet_gateway]
  connectivity_type = var.NAT_GATEWAYS_CONNECTIVITY_TYPE
}

resource "aws_route_table" "public_route_table" {
  count  = var.PUBLIC_ROUTE_TABLE_ID != "" ? 0 : 1
  vpc_id = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  route {
    cidr_block = var.PUBLIC_ROUTE_TABLE_CIDR_BLOCK
    gateway_id = var.INTERNET_GATEWAY_ID != "" ? var.INTERNET_GATEWAY_ID : join("", aws_internet_gateway.internet_gateway.*.id)
  }
  tags             = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Public Route Table" })}" : { Name = "${var.PROJECT_NAME} Public Route Table" }
  depends_on       = [aws_internet_gateway.internet_gateway]
  propagating_vgws = var.PUBLIC_ROUTE_TABLE_PROPAGATING_VGWS
}

resource "aws_route_table" "private_route_tables" {
  count  = length(var.PRIVATE_ROUTE_TABLE_ID_LIST) == 0 && length(var.NAT_GATEWAY_ID_LIST) == 0 ? length(aws_nat_gateway.nat_gateways[*].id) : length(var.PRIVATE_ROUTE_TABLE_ID_LIST) == 0 && length(var.NAT_GATEWAY_ID_LIST) > 0 ? length(var.NAT_GATEWAY_ID_LIST) : 0
  vpc_id = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  route {
    cidr_block     = var.PRIVATE_ROUTE_TABLES_CIDR_BLOCK
    nat_gateway_id = length(var.NAT_GATEWAY_ID_LIST) > 0 ? element(var.NAT_GATEWAY_ID_LIST, count.index) : aws_nat_gateway.nat_gateways[count.index].id
  }
  tags             = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Private Route Table ${count.index + 1}" })}" : { Name = "${var.PROJECT_NAME} Private Route Table ${count.index + 1}" }
  propagating_vgws = var.PRIVATE_ROUTE_TABLES_PROPAGATING_VGWS
}

resource "aws_route_table_association" "public_subnets_route_table_associations" {
  count          = var.PUBLIC_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION ? 0 : length(var.PUBLIC_SUBNET_ID_LIST) > 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(aws_subnet.public_subnets[*].id)
  subnet_id      = length(var.PUBLIC_SUBNET_ID_LIST) > 0 ? element(var.PUBLIC_SUBNET_ID_LIST, count.index) : aws_subnet.public_subnets[count.index].id
  route_table_id = var.PUBLIC_ROUTE_TABLE_ID != "" ? var.PUBLIC_ROUTE_TABLE_ID : join("", aws_route_table.public_route_table.*.id)
  depends_on     = [aws_route_table.public_route_table]
}

resource "aws_route_table_association" "private_subnets_route_table_associations" {
  count          = var.PRIVATE_SUBNETS_HAVE_ROUTE_TABLE_ASSOCIATION ? 0 : length(var.PRIVATE_SUBNET_ID_LIST) > 0 ? length(var.PRIVATE_SUBNET_ID_LIST) : length(aws_subnet.private_subnets[*].id)
  subnet_id      = length(var.PRIVATE_SUBNET_ID_LIST) > 0 ? element(var.PRIVATE_SUBNET_ID_LIST, count.index) : aws_subnet.private_subnets[count.index].id
  route_table_id = length(var.PRIVATE_ROUTE_TABLE_ID_LIST) > 0 ? element(var.PRIVATE_ROUTE_TABLE_ID_LIST, count.index) : aws_route_table.private_route_tables[count.index].id
  depends_on     = [aws_route_table.private_route_tables]
}

resource "aws_security_group" "security_group" {
  count       = var.CREATE_SECURITY_GROUP ? 1 : 0
  description = "Security group for ${var.PROJECT_NAME} application"
  vpc_id      = var.VPC_ID != "" ? var.VPC_ID : join("", aws_vpc.vpc.*.id)
  ingress {
    from_port   = var.SECURITY_GROUP_INGRESS_FROM_PORT
    to_port     = var.SECURITY_GROUP_INGRESS_TO_PORT
    protocol    = var.SECURITY_GROUP_INGRESS_RULES_PROTOCOL
    cidr_blocks = [var.SECURITY_GROUP_INGRESS_CIDR_BLOCK]
  }
  egress {
    from_port   = var.SECURITY_GROUP_EGRESS_FROM_PORT
    to_port     = var.SECURITY_GROUP_EGRESS_TO_PORT
    protocol    = var.SECURITY_GROUP_EGRESS_RULES_PROTOCOL
    cidr_blocks = [var.SECURITY_GROUP_EGRESS_CIDR_BLOCK]
  }
  tags                   = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME} Security Group" })}" : { Name = "${var.PROJECT_NAME} Security Group" }
  name                   = var.SECURITY_GROUP_NAME
  name_prefix            = var.SECURITY_GROUP_NAME_PREFIX
  revoke_rules_on_delete = var.SECURITY_GROUP_REVOKE_RULES_ON_DELETE
}