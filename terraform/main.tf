provider "aws" {
  region  = var.region
  profile = var.profile
}


#//////////////////////////////
#       resouce ec2
#//////////////////////////////
resource "aws_instance" "nginx" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.web_instance_type
  key_name        = var.web_key_name
  security_groups = [aws_security_group.aws_nginx.name]
  #   user_data       = file("ansible.sh")
  user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get -y install ansible
sudo apt-get -y install git
mkdir /home/baseConfig
cd /home/baseConfig/
git clone https://github.com/babakDoraniArab/testHtmlTemplate.git
mv testHtmlTemplate/* ./
rm -R testHtmlTemplate 
   EOF

  tags = {
    Terraform = "true"
    Name      = "nginx"
  }
}

output "aws_instance_nginx" {

  value       = aws_instance.nginx.public_ip
  description = "nginx public ip "
}
output "aws_instance_nginx_dns" {

  value       = aws_instance.nginx.public_dns
  description = "nginx public dns "
}
