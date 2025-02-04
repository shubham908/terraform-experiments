variable "ami" {
  type        = string
  description = "Ubuntu AMI ID"
  default     = "ami-05fa46471b02db0ce"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "my-ec2-instance"
}

output "public_ip" {
  value       = aws_instance.my_vm.public_ip
  description = "Public IP of the EC2 instance"
}

output "public_dns" {
  value       = aws_instance.my_vm.public_dns
  description = "Public DNS of the EC2 instance"
}
