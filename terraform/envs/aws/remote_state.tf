# if you want to use remote state, you should create a s3 bucket and configure it here
# terraform {
#   backend "s3" {
#     bucket = "aws-tfstate-storage"
#     key    = "sandbox/terraform.tfstate"
#     region = "eu-central-1"
#   }
# }