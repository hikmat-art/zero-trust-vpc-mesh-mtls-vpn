# Network Module

This module provisions the base networking layer:
- VPC
- Public and private subnets
- Internet Gateway
- NAT Gateways
- Route tables and associations

## Inputs
- `project_name` (string) → Project prefix
- `environment` (string) → Environment name
- `vpc_cidr` (string) → VPC CIDR block
- `public_subnets` (list) → Public subnet CIDRs
- `private_subnets` (list) → Private subnet CIDRs
- `availability_zones` (list) → Availability zones

## Outputs
- `vpc_id`
- `public_subnet_ids`
- `private_subnet_ids`
- `nat_gateway_ids`
