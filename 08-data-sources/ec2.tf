resource "aws_instance" "roboshop" {
  # argument
  ami           = data.aws_ami.ami_id.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_everything.id]

  tags = {
    Name = "HelloWorld"
  }
}
            #Type                  #Name
resource "aws_security_group" "allow_everything" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}