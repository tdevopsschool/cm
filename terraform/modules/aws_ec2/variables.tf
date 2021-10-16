variable "aws_subnet_id" {
  type    = string
}

variable "aws_security_group_id" {
  type    = string
}

variable "tags" {
  type = map(any)
}

variable "az" {
  type    = string
}

variable "ssh_key" {
  type    = string
}

variable "instances_count" {
  default = 1
}