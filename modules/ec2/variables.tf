variable "name" {
  type    = string
  default = "env0-acme-ec2"
}

variable "instance_type" {
  type    = string
  default = "t3a.micro"
}

variable "vpc_id" {
  type = string
}