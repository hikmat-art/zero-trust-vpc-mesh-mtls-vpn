# DNS Module

This module provisions a Route 53 private hosted zone for internal service discovery.

## Features
- Private hosted zone associated with VPC
- Alias records pointing to NLBs
- Supports service discovery for zero-trust architecture

## Inputs
- `project_name` → Project prefix
- `environment` → Environment name
- `vpc_id` → VPC ID
- `domain_name` → Base domain name
- `service_name` → Service name for record
- `nlb_dns_name` → NLB DNS name
- `nlb_zone_id` → NLB hosted zone ID

## Outputs
- `private_zone_id`
- `service_record_fqdn`
