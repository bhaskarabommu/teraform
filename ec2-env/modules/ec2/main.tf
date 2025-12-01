resource "aws_instance" "public_ec2" {
  ami           = var.public_ec2_ami
  instance_type = var.public_ec2_instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.public_ec2_sg_id]

  user_data = <<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sed -i 's/Welcome to Ubuntu/Hello from ${var.environment} EC2 Instance/' /var/www/html/index.html
EOF

  tags = {
    Name        = "public_ec2-${var.environment}"
    Environment = var.environment
  }
  
}

