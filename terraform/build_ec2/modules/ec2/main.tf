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
                    sudo apt-get install ca-certificates curl
                    sudo install -m 0755 -d /etc/apt/keyrings
                    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
                    sudo chmod a+r /etc/apt/keyrings/docker.asc
                    echo \
                      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
                      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
                      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                    sudo apt-get update
                    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
                    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    sudo chmod +x /usr/local/bin/docker-compose
                    sudo usermod -aG docker $USER
                    sudo newgrp docker
                    mkdir /home/ubuntu/web
                    EOF

    associate_public_ip_address = true
    security_groups = [var.security_groups]
  
}