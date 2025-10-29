resource "aws_instance" "roboshop" {
  # count = 3
  count = length(var.instances) ## length function
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t2.micro" : "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_everything.id]

  tags = merge(
    var.ec2_tags,
    var.common_tags,
    {
      Name = var.instances[count.index] #index starts with 0, 1, 2 etc...
      Component = var.instances[count.index]
    }
  )
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

  tags = merge(
    var.common_tags,
    {
      Name = var.sg_tags #index starts with 0, 1, 2 etc...
    }
  )
}