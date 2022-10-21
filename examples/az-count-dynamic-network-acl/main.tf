module "basenetworkingresources" {
  source                           = "../.."
  PROJECT_NAME                     = "NewModules"
  AZ_COUNT                         = 2
  CREATE_CUSTOM_PUBLIC_SUBNET_ACL  = true
  CREATE_CUSTOM_PRIVATE_SUBNET_ACL = true
  PUBLIC_SUBNET_ACL_RULE_INGRESS_LIST = [
    {
      rule_number = 100
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
    },

    {
      rule_number = 200
      egress      = false
      protocol    = "tcp"
      rule_action = "deny"
      cidr_block  = "172.0.0.0/0"
      from_port   = 80
      to_port     = 5000
    }
  ]
  PUBLIC_SUBNET_ACL_RULE_EGRESS_LIST = [
    {
      rule_number = 100
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
    },

    {
      rule_number = 200
      egress      = true
      protocol    = "tcp"
      rule_action = "deny"
      cidr_block  = "172.0.0.0/0"
      from_port   = 80
      to_port     = 5000
    }
  ]
  PRIVATE_SUBNET_ACL_RULE_INGRESS_LIST = [
    {
      rule_number = 100
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
    },

    {
      rule_number = 200
      egress      = false
      protocol    = "tcp"
      rule_action = "deny"
      cidr_block  = "172.0.0.0/0"
      from_port   = 80
      to_port     = 5000
    }
  ]
  PRIVATE_SUBNET_ACL_RULE_EGRESS_LIST = [
    {
      rule_number = 100
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
    },

    {
      rule_number = 200
      egress      = true
      protocol    = "tcp"
      rule_action = "deny"
      cidr_block  = "172.0.0.0/0"
      from_port   = 80
      to_port     = 5000
    }
  ]
}