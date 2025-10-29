resource "aws_instance" "roboshop" {
  ami                    = data.aws_ami.ami_id.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_everything.id]

  tags = merge(
    var.common_tags,
    {
      Name = var.ec2_tags
    }
  )
}

resource "aws_security_group" "allow_everything" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["cidr_blocks"]
      ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports
    content {
      from_port        = egress.value["from_port"]
      to_port          = egress.value["to_port"]
      protocol         = egress.value["protocol"]
      cidr_blocks      = egress.value["cidr_blocks"]
      ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"]
    }
  }

  tags = var.sg_tags
}