resource "aws_vpc" "mainly_vpc" {
    cidr_block = var.mainly_vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      Name = "mainly_vpc"
    }
  
}