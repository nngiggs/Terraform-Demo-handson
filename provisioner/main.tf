provider "aws" {
    region = us-eas-1
}

resource "aws_instance" "exameple" {
     ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    key_name = "demo-key"
    vpc_security_group_ids = [aws_security_group.main.id]
  

provisioner "file" {
    source = "\Users\nngig\OneDrive\Desktop\JJtech2022\infrastructure-as-code\Terraform\Terraform-Demo-handson\variable.tf.md"
    destination = "/home/ubuntu/test-file.txt"

}

# provisioner "local-exec" {
#     command = "touch hello-jhooq.txt"
# }

# provisioner "remote-exec" {
#     inline = [
#       "touch hello.txt",
#       "echo helloworld remote provisioner >> hello.txt",
#     ]
# }


connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file("home/private key path")
    timeout = "4m"
}
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}