output "pub_ip" {
  value = "${aws_instance.terraform_demo.public_ip}"
}

output "priv_ip" {
  value = "${aws_instance.terraform_demo.private_ip}"
}

output "subnet_id" {
  value = "${aws_instance.terraform_demo.subnet_id}"
}

output "security_groups" {
  value = "${aws_instance.terraform_demo.security_groups}"
}

output "key_name" {
  value = "${aws_instance.terraform_demo.key_name}"
}

output "instance_type" {
  value = "${aws_instance.terraform_demo.instance_type}"
}

