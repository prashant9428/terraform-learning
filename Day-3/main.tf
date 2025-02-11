provider "aws" {
  region = "ap-south-1"
}


module "ec2_instance" {
  source = "./modules/ec2"
  instance_type_value = "t2.micro"
  ami_value = "ami-00bb6a80f01f03502"
}