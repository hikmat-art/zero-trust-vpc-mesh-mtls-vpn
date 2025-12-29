# PKI Module

This module provisions AWS ACM Private Certificate Authorities (Root + Intermediate) and issues service certificates.

## Features
- Root CA (offline trust anchor)
- Intermediate CA for issuing leaf certs
- Example issued certificate for a service

## Inputs
- `project_name` → Project prefix
- `environment` → Environment name
- `root_ca_common_name` → Common name for root CA
- `domain_name` → Base domain for certs
- `service_name` → Service name for issued cert

## Outputs
- `root_ca_arn`
- `intermediate_ca_arn`
- `service_cert_arn`
