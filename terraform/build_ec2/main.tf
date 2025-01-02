terraform {
  backend "s3" {
    bucket = "bkt-tf-tfstate-gabogrobier-desafiolatam"
    key = "pruebafinal/desafiolatam/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "db-dynamo-tf-tfstate-gabogrobier-desafiolatam"
    encrypt = true
    
  }
}


module "provider" {
    source = "./modules/provider"
    region = local.region
  
}

module "vpc" {
    source = "./modules/vpc"
  
}

module "subnet" {
    source = "./modules/subnet"
    mainly_vpc_id = module.vpc.mainly_vpc_id
    availability_zone = "${local.region}a"
    cidr_block_subnet_private = local.private_subnet
    cidr_block_subnet_public = local.public_subnet
}

module "gateway" {
    source = "./modules/gateway"
    mainly_vpc_id = module.vpc.mainly_vpc_id
  
}

module "table_route" {
    source = "./modules/table_routes"
    mainly_vpc_id = module.vpc.mainly_vpc_id
    gateway_id = module.gateway.mainly_gatway_id
    public_subnet_id = module.subnet.public_subnet_id
  
}

module "security_group" {
    source = "./modules/security_group"
    mainly_vpc_id = module.vpc.mainly_vpc_id
  
}

module "ec2" {
    source = "./modules/ec2"
    security_groups = module.security_group.sg_id
    ami_ec2 = local.ami
    instance_name = local.ec2_name
    key_name_ec2 = local.key_name  
    public_subnet_id = module.subnet.public_subnet_id
}
