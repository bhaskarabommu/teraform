resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
    tags = {
        Name = "main_vpc-${var.environment}"
        Environment = var.environment
    }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id
    tags = {
        Name = "main_igw-${var.environment}"
        Environment = var.environment
    }
}

# public subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone
    tags = {
        Name = "public_subnet-${var.environment}"
        Environment = var.environment
    }
}

# private subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone = var.availability_zone
    tags = {
        Name = "private_subnet-${var.environment}"
        Environment = var.environment
    }
}

# route table for public subnet
resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
}

# associate route table with public subnet
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.main_rt.id
}

