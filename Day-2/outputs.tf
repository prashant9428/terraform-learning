output "instance_public_ip" {
  value = aws_instance.myTfServer.public_ip
}