variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "environment" {
  type = string
  description = "The deployment environment (e.g., dev, staging, prod)."
}