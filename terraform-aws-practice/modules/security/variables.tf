variable "project_name" {
  type = string
}

variable "vpc_id" {
  description = "VPC in which to create the security group"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Trusted public IP in CIDR notation, for example 3.87.245.232/32"
  type        = string
}
