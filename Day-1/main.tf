variable "region" {
  description = "value of region"
  type = string
  default = "ap-south-1"
}

provider "aws" {
  region = var.region
}


resource "aws_instance" "myTfServer" {
   ami = "ami-00bb6a80f01f03502"
   instance_type = "t2.nano"
   tags = {
     Name: "SampleServer"
   }
}