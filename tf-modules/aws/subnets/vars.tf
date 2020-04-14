variable "tags" {
  type = map(string)

  default = {
    Environment = "env"
    Account     = "dev"
    Group       = "devops"
    Region      = "us-east-1"
    managed_by  = "Terraform"
  }
}

variable "region" {
  description = "AWS region (i.e. us-east-1)"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "availability_zones" {
  description = "AZs for subnets i.e. [us-east-1a, us-east-1b]"
  type        = list(string)
}

variable "subnet_names" {
  description = "The names of the subnets"
  type = list(string)
}

variable "cidr_blocks" {
  description = "CIDR block for the subnet(s) (should be the same amount as AZs)"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  default = false
}
