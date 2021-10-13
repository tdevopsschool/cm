provider "aws" {}

data "aws_ami" "amzn" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*gp2"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "gitlab-runner" {
  ami                    = data.aws_ami.amzn.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.ssh_key.key_name
  availability_zone      = "eu-central-1a"
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags                   = { Environment = "sandbox" }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "deploy"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAmT6ztUvNgP6HZPo5qhYFZtZHvBET4CDjFhsv8TopqhZ9zn77JTTBuWqTNYmVt+fceSRvfBL7VBi8BBbav+i4KJlm6uunbT0JIWimz5/fHUqMU5H7lejZl9ExhxJreQ8LkPteRHKbwwIkglYvjSf1UeX/S9JPKBIMcvsuJfOLnfYLVvfSQ+gRfkitdcKzXDtmC++jhNjS6s6X9+4CJdaKeJKqSFu53aZubnhDHZVjFQv2NwVY597KWydX1NQ6vlhfpvoAUg03FVwKsVHaLqUUJ/r2ZTFhkoONiWV/MzCappMSsyOKQw7HKkfzzncFcD6P9Q6/FtbeenYRARgK0RbZbB+IFYvgsfvQgCW1ZzJ+dHf65NteV04XC3hFnm3eA59/mmRv7c7PARBwi8pN09uNsqAfF0qdfOdMekoclzSFwzsZjVqMEh2B30lwdOAYeLyasPbeWw+tf0ozDvcns4Nck1pYKa5hXXh7CycuCdyOjt7wXYPFOZiaFrghbU/1fc5eKWLNSEwUFhrlo4MjP3MCrpb1a3QlXGWd8WI7KGjQXneFFJmSN2As+vMuipDFDrgT+ADK6WPKjwFQoj6OJHi5KEPqvNh/hRKAyZKDrXDu/mgRvoMVdrsuJIB75egC7rObLaWpo7n7H2CSYafq4vkWQtpThODJ3k340HeaUMY6JC0="
}

resource "aws_security_group" "ssh" {
  vpc_id = aws_vpc.vpc.id
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
  tags = { Environment = "sandbox" }
}

resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"
  tags       = { Environment = "sandbox" }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "172.16.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"
  tags                    = { Environment = "sandbox" }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Environment = "sandbox" }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = { Environment = "sandbox" }
}

resource "aws_route_table_association" "route-table-association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route-table.id
}

output "ami_id" {
  value = data.aws_ami.amzn.id
}

output "public_ip" {
  value = aws_instance.gitlab-runner.public_ip
}
