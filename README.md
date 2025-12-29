# Zero-Trust VPC Mesh with mTLS VPN

This project provisions a beginner/intermediate-level **zero-trust network architecture** on AWS using Terraform.  
It demonstrates 3–4 years of AWS/Terraform proficiency with modular design, reproducibility, and security-first defaults.

## Features
- Multi-VPC network mesh (dev + prod)
- AWS Private CA (ACM PCA) for issuing certificates
- mTLS enforcement at NLB endpoints
- AWS Client VPN for developer access
- Private Route 53 DNS for service discovery
- Observability with VPC Flow Logs and CloudWatch
- Least-privilege IAM roles and scoped KMS keys

## Structure
- `modules/` → reusable Terraform modules
- `environments/` → dev/prod entrypoints
- Root files → docs, automation, pre-commit hooks

## Usage
```bash
# Initialize environment
cd environments/dev
terraform init

# Plan changes
terraform plan -var-file=../../terraform.tfvars.example

# Apply infrastructure
terraform apply -var-file=../../terraform.tfvars.example
