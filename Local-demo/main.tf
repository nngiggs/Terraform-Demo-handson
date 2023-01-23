provider "aws" {
    region = "us-east-1"
}

locals {
  name-prefix = "${var.project_name}-${var.environment}"
  #Environment = terraform.workspace
}

resource "aws_s3_bucket" "default" {
  bucket = "${local.name-prefix}-bucket"
  acl    = "private"
  tags = {
    Name = "${local.name-prefix}-bucket"
  }
}

resource "aws_instance" "ec2_example" {
  ami                     = var.ami
  instance_type           = var.instance_type
 #count = var.instance_count
  associate_public_ip_address = var.enable_public_ip

   tags = {
    Name = "${local.name-prefix}-Ec2"
  }
}