resource "aws_instance" "desafio_tf_instance" {
    ami = var.ami_ec2
    instance_type = var.instance_type
    subnet_id = var.public_subnet_id
    key_name = var.key_name_ec2
    tags = {
      Name = "${var.instance_name}"
    }
     user_data = <<-EOF
                    #!/bin/bash
                    sudo apt update 
                    sudo apt upgrade
                    sudo apt-get install -y docker docker-compose
                    sudo usermod -aG docker $USER
                    sudo newgrp docker
                    mkdir /home/ubuntu/web
                    EOF

    associate_public_ip_address = true
    security_groups = [var.security_groups]
  
}