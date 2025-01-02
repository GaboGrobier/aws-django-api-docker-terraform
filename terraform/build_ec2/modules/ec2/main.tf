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
                    sudo apt-get update 
                    sudo apt-get upgrade
                    sudo apt install docker.io -y
                    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    chmod +x /usr/local/bin/docker-compose
                    sudo usermod -aG docker $USER
                    sudo newgrp docker
                    mkdir /home/ubuntu/web
                    EOF

    associate_public_ip_address = true
    security_groups = [var.security_groups]
  
}