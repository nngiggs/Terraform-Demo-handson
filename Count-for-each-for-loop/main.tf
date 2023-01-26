provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    count = 1
    tags = {
      "Name" = "Terraform-ec2"
    }
  
}

# Iam user using loops with count 
# resource "aws_iam_user" "exameple" {
#     count = length(var.user_names)
#     name = var.user_names[count.index]

# }

# # Iam user using Loops with for Each
# resource "aws_iam_user" "exameple" {
#     for_each = var.user_names
#     name = each.value
  
# }

# variable used for the loop with count
variable "user_names" {
    description = "IAM usernames"
    type = list(string)
    default = ["user1", "user2", "user3"]
}

# # variable used with loop with for each, Note, you cannot use the list, you use set or map
# variable "user_names" {
#     description = "IAM usernames"
#     type = set(string)
#     default = [ "user1", "user2", "user3" ] 
# }

# for loop, here we will not use iam user resource but just output the usernames, use the list variables
output "print_the_names" {
    value = [for name in var.user_names : name]
  
}