provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "my_ec2_sg" {
  vpc_id = "vpc-0f74c17fa8c70efa3"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "demo" {
  ami = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  subnet_id = "subnet-07dc040fe117beff4"
  vpc_security_group_ids = [aws_security_group.my_ec2_sg.id]
}

