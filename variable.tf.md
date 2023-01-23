variable "instance_type" {
  description = "ec2 instance type t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ami of the instance"
  type        = string
  default     = "ami-0b5eea76982371e91"
}

variable "instance_count" {
  description = "the EC2 instance count"
  type        = number
  default     = 1
}
variable "enable_public_ip" {
    description = "enable public ip address"
    type = bool
    default = true
}

variable "user_names" {
    description = "IAM usernames"
    type = list(string)
    default = [ "user1", "user2", "user3" ]
  
}
variable "project_environment" {
    description = "project name and environment"
    type = map(string)
    default = {
      project = "project-Alpha"
      environment = "dev"
      Name = "Terraform EC2" 
    }
  
}

