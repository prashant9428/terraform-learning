

// VPC
resource "aws_vpc" "my-tr-vpc" {
   cidr_block = "10.0.0.0/16"
   tags = {
     Name: "my-tr-vpc"
   }
}

// Internet Gateway
resource "aws_internet_gateway" "my-tr-igw" {
   vpc_id = aws_vpc.my-tr-vpc.id
   tags = {
     Name:"my-tr-igw"
   }
}

// Subnet Configurations
resource "aws_subnet" "my-tr-public-subnet" {
  vpc_id = aws_vpc.my-tr-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name:"public-subnet"
  }
}

resource "aws_subnet" "my-tr-private-subnet" {
  vpc_id = aws_vpc.my-tr-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name:"private-subnet"
  }
}

// Route Table Configuration

resource "aws_route_table" "my-tr-rt" {
  vpc_id = aws_vpc.my-tr-vpc.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-tr-igw.id
  }

  tags = {
    Name:"my-terraform-route-tabe"
  }
}

// route subnet assosiation
resource "aws_route_table_association" "my-tr-rt-as" {
  route_table_id = aws_route_table.my-tr-rt.id
  subnet_id = aws_subnet.my-tr-public-subnet.id
}


resource "aws_instance" "myTfServer" {
   ami = "ami-00bb6a80f01f03502"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.my-tr-public-subnet.id
   tags = {
     Name: "SampleServer"
   }
}