## Instance

resource "aws_instance" "minecraft" {
  count = "${var.minecraft == "true" ? 1 : 0}"

  instance_type = "${var.big_minecraft == "true" ? "t2.medium" : "t2.small"}"
  ami           = "${data.aws_ami.centos7.id}"
  key_name      = "${aws_key_pair.gpg_auth.key_name}"

  security_groups             = ["${aws_security_group.minecraft.name}"]
  associate_public_ip_address = true

  user_data = "${data.template_file.minecraft-cloud-init.rendered}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }

  tags {
    Name = "minecraft"
  }
}

## Security group

resource "aws_security_group" "minecraft" {
  name        = "minecraft"
  description = "security group for minecraft server"
}

resource "aws_security_group_rule" "ssh_any_to_minecraft" {
  type              = "ingress"
  from_port         = 0
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.minecraft.id}"
}

resource "aws_security_group_rule" "minecraft_any_to_minecraft" {
  type              = "ingress"
  from_port         = 0
  to_port           = 25565
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.minecraft.id}"
}

resource "aws_security_group_rule" "all_minecraft_to_any" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.minecraft.id}"
}

## Cloud-init

data "template_file" "minecraft-cloud-init" {
  template = "${file("cloud-config.tpl")}"

  vars {
    hostname       = "minecraft"
    authorized_key = "${aws_key_pair.gpg_auth.public_key}"
  }
}
