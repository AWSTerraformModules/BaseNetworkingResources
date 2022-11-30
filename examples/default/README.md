# 7 Clouds Terraform AWS Base Networking Resources Module

* This module dynamically creates AWS basic networking resources for general use across several architectural patterns
* It's very easy to attach and adapt existing resources instead of creating new ones, considering the variables/conditions applied as we will show below
* This module allows you to dynamically create sets of resources on different availability zones on the given region. If you don't specify a value on "AZ_COUNT" variable, it will create resources in all AZ's of the given region. If you do specify, it will create only on the amount of AZ's chosen. Remember that you cannot specify a number that is greater than the amount of AZ's of the region you are working at. It is not possible to specify regions on a different order than AWS's standards

## Diagram

![AWS Resources Diagram for VPC, Subnets, Internet Gateway and Availability Zones](https://user-images.githubusercontent.com/106110465/193930951-b6974bf3-1993-438b-82ae-87181b18e6ce.png "Basic Networking Infrastructure")

## Usage

1. For <b>default</b> creation the only required variable is PROJECT_NAME, so the structural variables won't be overriden (default value for AZ_COUNT = 0):

```hcl
module "basenetworkingresources" {
  source       = "../.."
  PROJECT_NAME = "NewModules"
  AZ_COUNT     = 2
 }
```
* Always pay attention to your availability zones count or how many of them are available on the region you are using for deployment, once it might throw an error in case it does not match with the resources you are creating.
* Example: 

```hcl
AZ_COUNT              = 3
PUBLIC_SUBNET_ID_LIST = ["foo", "bar"]
```
*There should be 3 values for the related lists as well. If not, once we get to the end of a list it will iterate from the start again and you will probably have an unexpected output (with items from that list on multiple resources) and/or apply issues