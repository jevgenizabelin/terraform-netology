#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 3.0"
#    }
#  }

#  required_version = ">= 0.14.9"
#}

provider "aws" {
  profile = "jz-s3"
  region  = "us-west-2"
}

resource "aws_instance" "app_server_1" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "Netology_test_server"
  }
}
