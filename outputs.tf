output "public_ip" {
  description = "The public IP address of the Apache server EC2 instance"
  value       = aws_instance.apache.public_ip
}