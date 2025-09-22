variable "vpc_cidr" {
  type = string
}

variable "enable_dns_hostnames" {
  description = "make it true allways"
  default     = true
}
variable "enable_dns_support" {
  description = "make it true"
  default     = true
}

variable "instance_tenancy" {
  description = "make it default everytime"
  default     = "default"
}


variable "availability_zone" {
  type = list(string)
}

variable "subnet_id_public" {
  type = list(string)
}
variable "subnet_id_private" {
  type = list(string)
}

variable "resource_tags" {
  type = map(string)
}

variable "region_tag" {
  type = map(any)
  default = {
    "us-east-1"  = "eu1"
    "ap-south-1" = "ap1"
  }
}

variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "environment_tag" {
  type = map(any)
  default = {
    "dev"  = "D"
    "prod" = "P"
  }
}

