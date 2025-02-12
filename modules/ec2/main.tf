resource "aws_security_group" "tf_sg_web_server" {
  name        = "tf-sg-web-server"
  description = "Allow HTTP traffic to the web server"

  ingress {
    description = "HTTP ingress"
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
}

resource "aws_instance" "my_vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.tf_sg_web_server.id]
  user_data              = file("${path.module}/userData.sh")
  count                  = var.create_ec2 ? 1 : 0

  tags = {
    Name = var.name_tag
  }
}
