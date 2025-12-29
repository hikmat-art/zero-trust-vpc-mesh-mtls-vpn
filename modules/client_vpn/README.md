# Client VPN Module

This module provisions an AWS Client VPN endpoint with certificate-based authentication.

## Features
- VPN endpoint with certificate authentication
- Root CA validation for client certs
- CloudWatch logging for connections
- Subnet associations for routing
- Authorization rules for VPC access

## Inputs
- `project_name` → Project prefix
- `environment` → Environment name
- `vpn_cidr` → CIDR block for VPN clients
- `server_cert_arn` → ARN of server certificate
- `client_ca_cert_arn` → ARN of client CA certificate
- `subnet_ids` → Subnets to associate
- `vpc_cidr` → VPC CIDR for authorization

## Outputs
- `client_vpn_endpoint_id`
- `client_vpn_dns_name`
