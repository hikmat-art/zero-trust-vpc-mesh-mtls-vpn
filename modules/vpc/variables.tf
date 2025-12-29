###variable "name" {
  type = string
}

variable "cidr_block" {
  description = "Primary CIDR block for the VPC"
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
