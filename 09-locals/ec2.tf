resource "aws_instance" "roboshop" {
  # count = 5
  count = length(var.instances)
  ami           = var.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = local.sg_id

  tags = local.ec2_tags[var.instances[count.index]]
}

resource "aws_security_group" "allow_everything" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = var.sg_tags
}