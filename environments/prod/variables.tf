variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDRs"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones"
}

variable "root_ca_common_name" {
  type        = string
  description = "Common name for root CA"
}

variable "domain_name" {
  type        = string
  description = "Base domain name"
}

variable "service_name" {
  type        = string
  description = "Service name for DNS and certs"
}

variable "vpn_cidr" {
  type        = string
  description = "CIDR block for VPN clients"
}

variable "config_bucket_name" {
  type        = string
  description = "S3 bucket for AWS Config delivery"
}
