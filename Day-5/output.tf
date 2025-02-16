
output "ec2-ip-address" {
  description = "ec2 public ip address"
  value       = aws_instance.ng-server.public_ip
}


output "ngnix-server-url" {
  description = "ngnix server url"
  value       = "http://${aws_instance.ng-server.public_ip}"

}