variable "region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-west-2"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type = string
  default = "t3.small"
}

variable "instance_keypair" {
    type = string
    default = "main-key-23"
}