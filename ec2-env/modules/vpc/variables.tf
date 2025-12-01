variable "vpc_cidr" {
  description = "CIDR of vpc"
  type = string
}

variable "environment" {
  description = "Deployment environment"
  type = string
}

variable "public_subnet_cidr" {
  description = "CIDR of public subnet"
  type = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type = string
}

variable "private_subnet_cidr" {
  description = "CIDR of private subnet"
  type = string
}

