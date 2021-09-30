terraform {
  required_version = "~> 1.0.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.57" # Optional but recommended in production
    }
  }
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-087c17d1fe0178315" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  tags = var.tags
}