provider "aws" {
  region = "ap-south-1"
}


resource "aws_security_group" "ec2_sg" {
    vpc_id = "vpc-0f74c17fa8c70efa3"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_key_pair" "example" {
  key_name   = "terraform-demo"
  public_key = file("C:/bhaskar-notes/terraform/ec2_vpc/provisioners/my-key.pub")
}

resource "aws_instance" "demo" {
  ami = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id = "subnet-07dc040fe117beff4"
  key_name = aws_key_pair.example.key_name

  provisioner "remote-exec" {

    inline = [ 
        "sudo apt-get update",
        "sudo apt-get install -y nodejs npm",
        "sudo npm install -g create-react-app",
        "npx create-react-app app -y",
        "cd app",
        "npm start"
     ]
    connection {
      type        = "ssh"
      user        = "ubuntu" # Default user for Ubuntu AMI
      private_key = file("C:/bhaskar-notes/terraform/ec2_vpc/provisioners/my-key")
      host        = self.public_ip
    }
  } 
}