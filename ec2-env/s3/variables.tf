variable "aws_region" {
  type        = string
  description = "region for aws"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "name of the environment (e.g. dev, prod, test)"
  default     = "dev"
}

