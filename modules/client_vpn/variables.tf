variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/prod)"
}

variable "vpn_cidr" {
  type        = string
  description = "CIDR block for client VPN"
}

variable "server_cert_arn" {
  type        = string
  description = "ARN of server certificate for VPN endpoint"
}

variable "client_ca_cert_arn" {
  type        = string
  description = "ARN of client CA certificate for authentication"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to associate with VPN"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the VPC"
}
