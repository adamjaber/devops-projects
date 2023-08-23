

output "jenkins-url" {
    value = join ("",["http://", aws_instance.ec2-jenkins-terraform.public_dns, ":", "8080"])
  
}