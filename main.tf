terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
 }

  required_version = ">= 0.14.9"
}

#provider "aws" {
#  profile = "jz-s3"
#  region  = "us-west-2"
#}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.jz-subnet.id

  tags = {
    Name = "Netology_app_server"
  }
}


provider "aws" {
  profile = "jz-s3"
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_vpc" "default" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "jz-subnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "172.31.75.0/24"
}
