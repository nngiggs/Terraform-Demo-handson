provider "aws" {
    region = "us-east-1"
    #access_key = 
    #secret_key = 
}
# we are going to use locals to define our tags hence we will comment the previous tagging method.
/*
locals {
  environment = "staging"
  createdby = "GidOliTech"
  createdon = timestamp()
  project = "project-Alpha"
} */
locals {
  resourcename = "${var.project_environment}-GidOli"
}
/*
resource "aws_vpc" "staging-vpc" {
    cidr_block = "10.5.0.0/16"
tags = {
    Name = "${local.staging_env}-vpc-tag"
}
}

resource "aws_subnet" "staging-subnet" {
    vpc_id = aws_vpc.staging-vpc.id
    cidr_block = "10.5.0.0/16"
    tags = {
      "Name" = "${local.staging_env}-subnet-tag"
    }
}
*/
resource "aws_instance" "ec2_example" {
  ami                     = var.ami
  instance_type           = var.instance_type
 #count = var.instance_count
  associate_public_ip_address = var.enable_public_ip
 # subnet_id = aws_subnet.staging-subnet.id
 /*
 tags = {
    Name = "${local.environment}-Terraform EC2"
    createdby = "${local.createdby}"
    project = "${local.project}"
    createdon = "${local.createdon}"

  } */
   tags = var.project_environment
  
}
# showing output and hidden sensitive outputs.
output "my_console_output" {
#   value = aws_instance.ec2_example.
    value = "this is just to show that sensitive will not print"
    sensitive = true 

}

# resource "aws_iam_user" "example" {
#     count = length(var.user_names)
#     name = var.user_names[count.index]
  
# }

