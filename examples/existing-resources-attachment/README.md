# Basic networking resources for general use

* This module dynamically creates AWS basic networking resources for general use across several architectural patterns
* It's very easy to attach and adapt existing resources instead of creating new ones, considering the variables/conditions applied as we will show below

## Diagram

![AWS Resources Diagram for VPC, Subnets, Internet Gateway and Availability Zones](https://user-images.githubusercontent.com/106110465/193930951-b6974bf3-1993-438b-82ae-87181b18e6ce.png "Basic Networking Infrastructure")

## Usage

1. For <b>existing resources attachment</b> use their ID's to fill the resource variables with "_ID" on it. In this case, filling the subnets ID's variables ("PUBLIC_SUBNET_ID_LIST" and PRIVATE_SUBNET_ID_LIST) affects directly the resources which their "COUNT" related to them:

```hcl
module "basenetworkingresources" {
  source                          = "../.."
  PROJECT_NAME                    = "NewModules"
  PUBLIC_SUBNET_ID_LIST           = ["YourPublicSubnetsID(s)Here"]
  PRIVATE_SUBNET_ID_LIST          = ["YourPrivateSubnetsID(s)Here"]
}
```

2. Visual Example:

```hcl
resource "aws_eip" "elastic_ips" {
  count = length(var.PUBLIC_SUBNET_ID_LIST) > 0 && length(var.ELASTIC_IP_ALLOCATION_ID_LIST) == 0 ? length(var.PUBLIC_SUBNET_ID_LIST) : length(var.PUBLIC_SUBNET_ID_LIST) == 0 && length(var.ELASTIC_IP_ALLOCATION_ID_LIST) == 0 ? length(aws_subnet.public_subnets.*.id) : 0
}
```

* Elastic IP's are a nice example as a resource count related to subnets ID's.

* If var.PUBLIC_SUBNET_ID_LIST is greater than Zero AND var.ELASTIC_IP_ALLOCATION_ID_LIST is EQUAL to Zero, the count result will be the var.PUBLIC_SUBNET_ID_LIST length

* If var.PUBLIC_SUBNET_ID_LIST AND var.ELASTIC_IP_ALLOCATION_ID_LIST are both EQUAL to Zero, the count argument takes the length result from the public subnet(s) to be created, by reference, as value

* If none of the previous validations pass, the count will be Zero