# Terraform Settings Block
terraform {
  required_version = "~> 1.0.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.57" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  # region  = "us-east-1"
  region = var.region
}

# Resource Block
module "ec2_instance" {
  source = "../module/ec2"

  image_name = "ami-ubuntu-18.04-1.16.0-00-1569343567"
  virtualization_type = "hvm"
  # ami           = "ami-087c17d1fe0178315" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  ami_owner = "866375853664"
  tags = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }
}

module "s3_bucket" {
  source = "../module/s3"
  bucket_name = "mybucket"
  acl = "private"
  tags = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }
}