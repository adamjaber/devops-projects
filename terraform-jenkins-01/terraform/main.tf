provider "aws" {
  region = var.region
  access_key = "xxxx"   #Change here
  secret_key = "xxxxx"  #Change here
}

terraform {
  backend "s3" {
    bucket         = "terraform-statefile-2323" 
    key            = "jenkins-terraform-statefile/jenkins-terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}


# EC2 Instance
resource "aws_instance" "ec2-jenkins-terraform" {
  ami = "ami-0e0f3d4588f992288"
  instance_type = var.instance_type
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.jenkins-terraform.id]

}

#empty resource block
resource "null_resource" "name" {
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("~/.ssh/main-xxxx.pem") #Change here
    host     = aws_instance.ec2-jenkins-terraform.public_ip

  }

  provisioner "file" {
    source      = "jenkins-install.sh"
    destination  = "/tmp/jenkins-install.sh"

}

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/jenkins-install.sh",
      "sh /tmp/jenkins-install.sh",
    ]
  }

  depends_on = [aws_instance.ec2-jenkins-terraform ]
}



resource "aws_security_group" "jenkins-terraform" {
  name        = "jenkins-terraform"
  description = "jenkins-terraform "

  ingress {
    description      = "allow-https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
  ingress {
    description      = "allow-http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "allow-ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "allow-8080"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_jenkins"
  }
}