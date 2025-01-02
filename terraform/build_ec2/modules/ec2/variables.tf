variable "ami_ec2" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "instance_name" {
    type = string

  
}

variable "security_groups" {
    type = string

  
}

variable "key_name_ec2" {
    type = string
  
}
variable "public_subnet_id" {
    type = string
  
}

