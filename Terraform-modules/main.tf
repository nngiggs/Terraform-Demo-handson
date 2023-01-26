provider "aws" {
    region = "us-east-1"
  
}
 
 module "giggs-webserver-1" {
    source = ".//module-1"
 }

 module "giggs-webserver-2" {
    source = ".//module-2"
 }