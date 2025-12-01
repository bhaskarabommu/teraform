output "public_ec2_ami" {
  description = "AMI ID of the public EC2 instance"
  value       = aws_instance.public_ec2.ami
}

output "public_ec2_instance_type" {
  description = "Instance type of the public EC2 instance"
  value       = aws_instance.public_ec2.instance_type
}

output "public_ec2_subnet_id" {
  description = "Subnet ID of the public EC2 instance"
  value       = aws_instance.public_ec2.subnet_id
}

output "public_ec2_sg_ids" {
  description = "Security Group IDs of the public EC2 instance"
  value       = aws_instance.public_ec2.vpc_security_group_ids
}

output "public_ec2_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.public_ec2.id
}

