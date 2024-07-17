terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}


provider "aws" {
  region     = "ap-southeast-1"
  
  
}

#Create a new EC2 launch configuration
resource "aws_instance" "ec2_public" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = ["${aws_security_group.ssh-security-group.id}"]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  tags = {
    "Name" = "EC2"
  }
  #iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
  lifecycle {
    create_before_destroy = true
  }
  
  user_data = <<-EOF
           #!/bin/bash
          sudo su 
          sudo apt update
          sudo apt install -y nginx 
          sudo systemctl start nginx
          sudo systemctl enable nginx
          sudo systemctl status nginx 
          echo "<h1>Hello World</h1>" > /usr/share/nginx/html/index.html
  EOF
}



