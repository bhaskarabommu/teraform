variable "public_ec2_ami" {
  description = "ami id of public_ec2"
  type = string
}

variable "public_ec2_instance_type" {
  description = "instance type of public_ec2"
  type = string
}

variable "public_subnet_id" {
  description = "subnet id for public_ec2"
  type = string
}

variable "environment" {
  description = "Deployment environment"
  type = string
}

variable "public_ec2_sg_id" {
  description = "security group of public ec2"
  type = string
}
