provider "aws" {
  alias = "ap-south-1"
  region = var.region-ap-south-1
}

provider "aws" {
  alias = "us-east-1"
  region = var.region-us-east-1
}

resource "aws_instance" "myTfServer" {
   ami = var.ec2-instance-ami-ap-south-1
   instance_type = "t2.micro"
   tags = {
     Name: "SampleServerTest"
     
   }
   provider = aws.ap-south-1
}

resource "aws_instance" "myTfServerTwo" {
   ami = var.ec2-instance-ami-us-east-1
   instance_type = "t2.micro"
   tags = {
     Name: "SampleServerTest"
     
   }
   provider = aws.us-east-1
}