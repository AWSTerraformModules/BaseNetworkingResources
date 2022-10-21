# Basic networking resources for with Network ACL for each Subnet

* This module dynamically creates AWS basic networking resources for general use across several architectural patterns
* It's very easy to attach and adapt existing resources instead of creating new ones, considering the variables/conditions applied as we will show below
* This module allows you to dynamically create sets of resources on different availability zones on the given region. If you don't specify a value on "AZ_COUNT" variable, it will create resources in all AZ's of the given region. If you do specify, it will create only on the amount of AZ's chosen. Remember that you cannot specify a number that is greater than the amount of AZ's of the region you are working at. It is not possible to specify regions on a different order than AWS's standards
* This example shows an usage case for Custom Network ACL dynamic creation, association and rules. Based on each subnet created
* You may apply the rules according to your needs, they are nested in map within a list

## Diagram

![AWS Resources Diagram for VPN, Subnets, Network Access Control Lists, Internet Gateway and Availability Zones](https://user-images.githubusercontent.com/106110465/197301881-87f1bc11-871e-4f51-860d-93f541cbb4de.png "Basic Networking Infrastructure")

## Usage

1. For <b>az count</b> creation the required variables are "PROJECT_NAME" and AZ_COUNT so all the project will be based on the creation of the Availability Zones. We have included a VPC for the example also:

```hcl
module "basenetworkingresources" {
  source       = "../.."
  PROJECT_NAME = "NewModules"
  AZ_COUNT     = 2
  CREATE_CUSTOM_PUBLIC_SUBNET_ACL = true
  CREATE_CUSTOM_PRIVATE_SUBNET_ACL = true
  CREATE_CUSTOM_PUBLIC_SUBNET_ACL_ASSOCIATION = true
  CREATE_CUSTOM_PRIVATE_SUBNET_ACL_ASSOCIATION = true
  CREATE_CUSTOM_PUBLIC_SUBNET_ACL_RULE_INGRESS = true
  CREATE_CUSTOM_PUBLIC_SUBNET_ACL_RULE_EGRESS = true
  CREATE_CUSTOM_PRIVATE_SUBNET_ACL_RULE_INGRESS = true
  CREATE_CUSTOM_PRIVATE_SUBNET_ACL_RULE_EGRESS = true
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
```
* Always pay attention to your availability zones count and how many of them are available on the region you are using for deployment, there must be the at least same amount of them for this region as declared in the "AZ_COUNT" value.