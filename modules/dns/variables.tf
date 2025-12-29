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
  description = "VPC ID to associate with private hosted zone"
}

variable "domain_name" {
  type        = string
  description = "Base domain name for private DNS"
}

variable "service_name" {
  type        = string
  description = "Service name for DNS record"
  default     = "app"
}

variable "nlb_dns_name" {
  type        = string
  description = "DNS name of the NLB"
}

variable "nlb_zone_id" {
  type        = string
  description = "Hosted zone ID of the NLB"
}
