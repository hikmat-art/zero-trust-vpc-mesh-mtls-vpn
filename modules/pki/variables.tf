variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/prod)"
}

variable "root_ca_common_name" {
  type        = string
  description = "Common name for the root CA"
}

variable "domain_name" {
  type        = string
  description = "Base domain name for issued certs"
}

variable "service_name" {
  type        = string
  description = "Service name for issued certificate"
  default     = "app"
}
