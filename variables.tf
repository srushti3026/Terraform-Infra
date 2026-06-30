variable "aws_region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "demo-infra"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "AWS EC2 Key Pair Name"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "RDS Password"
  sensitive   = true
}
