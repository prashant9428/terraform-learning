// create vpc
resource "aws_vpc" "my-ng-vpc" {
  cidr_block = var.cidr
  tags = {
    Name: "my-ng-vpc"
  }
}

// create subnet

resource "aws_subnet" "public-sub" {
  vpc_id = aws_vpc.my-ng-vpc.id
  cidr_block = var.pub-sub-cidr
  availability_zone = "ap-south-1a"
 
  tags = {
    Name:"ng-public-subnet"
  }
}

resource "aws_subnet" "private-sub" {
  vpc_id = aws_vpc.my-ng-vpc.id
  cidr_block = var.pvt-sub-cidr
  availability_zone = "ap-south-1a"
 
  tags = {
    Name:"ng-private-subnet"
  }
}

// internet gateway

resource "aws_internet_gateway" "ng-igw" {
  vpc_id = aws_vpc.my-ng-vpc.id
  tags = {
    Name: "ng-igw"
  }
}

// route table
resource "aws_route_table" "ng-route-tb" {
  vpc_id = aws_vpc.my-ng-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ng-igw.id
  }
  
  tags = {
    Name: "ng-route-tb"
  }
}

// route table association
resource "aws_route_table_association" "ng-route-as" {
  route_table_id = aws_route_table.ng-route-tb.id
  subnet_id = aws_subnet.public-sub.id
}


resource "aws_security_group" "ng-security_groups" {
  vpc_id = aws_vpc.my-ng-vpc.id

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name : "ng-security-group"
  }
}

