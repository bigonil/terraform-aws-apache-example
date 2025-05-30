variable "vpc_id" {
  description = "The ID of the VPC where the instance will be launched"
  type        = string
}

variable "my_ip_with_cidr" {
  description = "Your IP address with CIDR mask for SSH access (e.g., 203.0.113.0/32)"
  type        = string
}

variable "public_key" {
  description = "SSH public key to be used for accessing the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "server_name" {
  description = "Name tag to assign to the EC2 instance"
  type        = string
}