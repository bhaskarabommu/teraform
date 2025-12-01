variable "environment" {
  type = string
  description = "The environment for the security group (e.g., dev, staging, prod)."
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC where the security group will be created"
}