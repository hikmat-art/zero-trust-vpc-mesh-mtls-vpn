variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/prod)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where NLB is deployed"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "target_port" {
  type        = number
  description = "Port for target group"
  default     = 8080
}

variable "server_cert_arn" {
  type        = string
  description = "ARN of server certificate issued by ACM PCA"
}

variable "client_ca_cert_arn" {
  type        = string
  description = "ARN of client CA certificate for mTLS validation"
}
