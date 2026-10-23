variable "project_name" {
  type = string
}

variable "ami_id" {
  description = "AMI ID available in the chosen AWS region"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}
