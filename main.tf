resource "aws_key_pair" "ramguru" {
  key_name = "ramguru"
  public_key = "${file("${var.public_key_path}")}"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "terraform_Demo_SG" {
  name = "terraform_Demo_SG"
  vpc_id = data.aws_vpc.default.id

    ingress  {
      from_port = "22"
      to_port = "22"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress  {
      from_port = "80"
      to_port = "80"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress  {
      from_port = "443"
      to_port = "443"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "terraform_demo" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.ramguru.key_name}"
  security_groups = ["terraform_Demo_SG"]

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    host = "${self.public_ip}"
    user = "${var.login_user}"
    private_key = "${file("${var.private_key_path}")}"
  }
}

