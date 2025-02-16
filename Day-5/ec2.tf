resource "aws_instance" "ng-server" {
  ami                         = "ami-00bb6a80f01f03502"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-sub.id
  security_groups             = [aws_security_group.ng-security_groups.id]
  associate_public_ip_address = true

  user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update
                  sudo apt install nginx -y
                  sudo systemctl start nginx
                  sudo systemctl enable nginx
            EOF

  tags = {
    Name : "ng-server"
  }
}
