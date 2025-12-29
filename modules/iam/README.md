# IAM Module

This module provisions IAM roles and policies with least privilege for Terraform-managed resources.

## Features
- Terraform execution role
- Scoped IAM policy for VPC, PKI, NLB, DNS, and observability
- Tags for environment and project tracking

## Inputs
- `project_name` → Project prefix
- `environment` → Environment name

## Outputs
- `terraform_role_arn`
