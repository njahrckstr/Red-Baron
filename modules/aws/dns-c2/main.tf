terraform {
  required_version = ">= 0.10.0"
}

resource "aws_key_pair" "dns-c2" {
  key_name = "dns-c2-key"
  public_key = "${file(var.ssh_public_key)}"
}

resource "aws_instance" "dns-c2" {
  count = "${var.count}"
  tags = {
    Name = "dns-c2-${count.index}"
  }

  ami = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.dns-c2.key_name}"
  vpc_security_group_ids = ["${aws_security_group.dns-c2.id}"]
  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = true

  provisioner "remote-exec" {
    scripts = "${var.install}"

    connection {
        type = "ssh"
        user = "admin"
        private_key = "${file(var.ssh_private_key)}"
    }
  }
}