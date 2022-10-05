# Basic networking resources for general use

* This module dynamically creates AWS basic networking resources for general use across several architectural patterns
* It's very easy to attach and adapt existing resources instead of creating new ones, considering the variables/conditions applied as we will show below
* This module allows you to dynamically create sets of resources on different availability zones on the given region. If you don't specify a value on "AZ_COUNT" variable, it will create resources in all AZ's of the given region. If you do specify, it will create only on the amount of AZ's chosen. Remember that you cannot specify a number that is greater than the amount of AZ's of the region you are working at. It is not possible to specify regions on a different order than AWS's standards

## Diagram

![AWS Resources Diagram for VPN, Subnets, Internet Gateway and Availability Zones](https://user-images.githubusercontent.com/106110465/193930951-b6974bf3-1993-438b-82ae-87181b18e6ce.png "Basic Networking Infrastructure")

## Usage

1. For <b>az count</b> creation the required variables are "PROJECT_NAME" and AZ_COUNT so all the project will be based on the creation of the Availability Zones. We have included a VPC for the example also:

```hcl
module "basenetworkingresources" {
  source       = "../.."
  PROJECT_NAME = "NewModules"
  AZ_COUNT     = 2
  VPC_ID       = "vpc-08c5dd41e8d7cb857"
 }
```
* Always pay attention to your availability zones count and how many of them are available on the region you are using for deployment, there must be the at least same amount of them for this region as declared in the "AZ_COUNT" value.