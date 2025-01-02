resource "aws_subnet" "private_subnet" {
    vpc_id = var.mainly_vpc_id
    cidr_block =var.cidr_block_subnet_private
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
  
}

resource "aws_subnet" "public_subnet" {
    vpc_id = var.mainly_vpc_id
    cidr_block =var.cidr_block_subnet_public
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
  
}