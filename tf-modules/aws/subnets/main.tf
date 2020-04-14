terraform {
  backend "s3" {
  }
}

provider "aws" {
  region = var.region
}

resource "aws_subnet" "subnet" {
  count                   = length(var.availability_zones)
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.cidr_blocks, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(var.tags, { "Name" = var.subnet_names[count.index] }) 

  lifecycle {
    create_before_destroy = true
  }
}
