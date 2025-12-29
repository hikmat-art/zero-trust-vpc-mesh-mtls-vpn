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
  description = "VPC ID for flow logs"
}

variable "config_bucket_name" {
  type        = string
  description = "S3 bucket name for AWS Config delivery"
}
