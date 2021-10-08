data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
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
  availability_zone      = var.az
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = var.tags
}