## Instance

resource "aws_instance" "spark" {
  instance_type = "t2.micro"
  ami           = "${data.aws_ami.centos7.id}"
  key_name      = "${aws_key_pair.gpg_auth.key_name}"

  security_groups             = ["${aws_security_group.spark.name}"]
  associate_public_ip_address = true

  user_data = "${data.template_file.cloud-init.rendered}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }

  tags {
    Name = "spark"
  }
}

## Security group

resource "aws_security_group" "spark" {
  name        = "spark"
  description = "ad-hoc security group for spark, a standalone, multi-purpose instance"
}

resource "aws_security_group_rule" "ssh_inbound" {
  type              = "ingress"
  from_port         = 0
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.spark.id}"
}

resource "aws_security_group_rule" "http_inbound" {
  type              = "ingress"
  from_port         = 0
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.spark.id}"
}

resource "aws_security_group_rule" "https_inbound" {
  type              = "ingress"
  from_port         = 0
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.spark.id}"
}

resource "aws_security_group_rule" "all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.spark.id}"
}

## Cloud-init

data "template_file" "cloud-init" {
  template = "${file("cloud-config.tpl")}"

  vars {
    authorized_key = "${aws_key_pair.gpg_auth.public_key}"
  }
}
