module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
    private_subnet_cidr = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    environment = var.environment
}


data "aws_ami" "ubuntu_2204" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

module "ec2" {
  source = "./modules/ec2"
    public_ec2_ami = data.aws_ami.ubuntu_2204.id
    public_ec2_instance_type = "t2.micro"
    public_subnet_id = module.vpc.public_subnet_id
    public_ec2_sg_id = module.security.public_ec2_sg_id
    environment = var.environment
}

module "security" {
  source = "./modules/security"
    vpc_id = module.vpc.vpc_id
    environment = var.environment
}