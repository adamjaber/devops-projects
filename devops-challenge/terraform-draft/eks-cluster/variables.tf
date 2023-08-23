variable "region" {
  type = string
  default = "us-west-2"
}

variable "sunbets" {
  type    = list(string)
  default = ["subnet-0d33350d0410d269f", "subnet-0864e6401313384f9"]
}


variable "cluster-name" {
  type = string
  default = "calculator-application"
}