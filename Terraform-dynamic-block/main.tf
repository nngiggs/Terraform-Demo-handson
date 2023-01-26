provider "aws" {
    region = "us-east-1"

}

locals {
  ingress_rules = [{
    port = 443
    description = "ingress rules for port 443"
  },
  {
    port = 22
    description = "ingress rules for port 22"
  }]
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    key_name = "demo-key"
    vpc_security_group_ids = [aws_security_group.main.id]
  
}
#egress security group rule has been left the usual long way but ingress used dynamic
resource "aws_security_group" "main" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            description = ""
            from_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            protocol = "-1"
            security_groups = []
            self = false
            to_port = 0
        }
    ]
    # dynamic block used here below for comparison 
    dynamic "ingress" {
        for_each = local.ingress_rules

        content {
          description = ingress.value.description 
          from_port = ingress.value.port
          to_port = ingress.value.port 
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      
    }
  
}