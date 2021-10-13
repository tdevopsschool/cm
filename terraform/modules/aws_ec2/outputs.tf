output "ami_id" {
  value = data.aws_ami.amzn.id
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}
