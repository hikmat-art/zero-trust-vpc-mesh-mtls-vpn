# NLB mTLS Service Module

This module provisions a Network Load Balancer (NLB) with TLS termination and **mutual TLS (mTLS)** client certificate validation.

## Features
- NLB in public subnets
- Target group for backend instances
- TLS listener with strong security policy
- Server certificate from ACM PCA
- Client certificate validation for mTLS

## Inputs
- `project_name` → Project prefix
- `environment` → Environment name
- `vpc_id` → VPC ID
- `public_subnet_ids` → Public subnet IDs
- `target_port` → Backend port (default 8080)
- `server_cert_arn` → ARN of server certificate
- `client_ca_cert_arn` → ARN of client CA certificate

## Outputs
- `nlb_dns_name`
- `target_group_arn`
