module "aws_network" {
  source = "../../modules/aws_network"
  tags   = var.tags
  az     = var.az
}

module "gitlab_runner" {
  source                = "../../modules/aws_ec2"
  tags                  = var.tags
  az                    = var.az
  ssh_key               = var.ssh_key
  aws_subnet_id         = module.aws_network.aws_subnet_id
  aws_security_group_id = module.aws_network.aws_security_group_id
}
