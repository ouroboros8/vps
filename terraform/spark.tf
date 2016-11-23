data "aws_ami" "centos" {
    most_recent = true
    filter {
        name = "product-code"
        values = ["aw0evgkw8e5c1q413zgy5pjce"]
    }
}

resource "aws_security_group" "spark" {
    name = "spark"
    description = "ad-hoc security group for spark, a standalone, multi-purpose instance"

    # SSH
    ingress {
        from_port = 0
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTP
    ingress {
        from_port = 0
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTPS
    ingress {
        from_port = 0
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "spark" {
    instance_type = "t2.micro"
    ami = "${data.aws_ami.centos.id}"
    key_name = "${var.key}"

    security_groups = ["${aws_security_group.spark.name}"]
    associate_public_ip_address = true

    root_block_device {
        volume_type = "gp2"
        volume_size = "30"
        delete_on_termination = "true"
    }

    # user data

}
