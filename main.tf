data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "apache_key"
  public_key = var.public_key
}

resource "aws_security_group" "apache_sg" {
  name        = "apache-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_with_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "apache-sg"
  }
}

resource "aws_instance" "apache" {
  ami                    = "ami-0554aa6767e249943" # Amazon Linux 2 (us-east-1) ✅
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.selected.ids[0]
  vpc_security_group_ids = [aws_security_group.apache_sg.id]
  key_name               = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>${var.server_name}</h1>" > /var/www/html/index.html
            EOF

  tags = {
    Name = var.server_name
  }
}