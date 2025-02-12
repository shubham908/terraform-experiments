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

variable "create_ec2" {
  description = "Flag to enable the EC2 instance creation"
  type        = bool
  default     = false
}
