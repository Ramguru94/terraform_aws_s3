variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-2"
}
variable "amis" {
  type = "map"
  default = {
    us-east-1 = "ami-0fb0129cd568fe35f"
    us-east-2 = "ami-00f03cfdc90a7a4dd"
    us-west-1 = "ami-0fb0129cd568fe35f"
  }
}
variable "public_key_path" {
  default = "ramguru.pub"
}
variable "private_key_path" {
  default = "ramguru"
}
variable "login_user" {
  default = "ubuntu"
}

