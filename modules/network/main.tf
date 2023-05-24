resource "aws_vpc" "vpc" {
  cidr_block  = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.cluster_name}-vpc"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.cluster_name}-igvpc"
  }
}

resource "aws_subnet" "public_subnet_a" {
  availability_zone       = "${var.region}a"
  cidr_block              = var.public_subnet_a_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.cluster_name}-PublicSubnet1"
  }

  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_subnet_b" {
  availability_zone       = "${var.region}b"
  cidr_block              = var.public_subnet_b_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.cluster_name}-PublicSubnet2"
  }

  vpc_id = aws_vpc.vpc.id
}
/*
resource "aws_security_group" "security_group" {
  description = "${var.cluster_name}-sg-ec2"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    from_port       = 0
    protocol        = "tcp"
    #security_groups = [aws_security_group.alb.id]
    to_port         = 65535
  }
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }


  name = "${var.cluster_name}-sg-ec2"

  tags = {
    Env  = var.environment
    Name = "${var.cluster_name}-sg-ec2"
  }

  vpc_id = aws_vpc.vpc.id
}*/