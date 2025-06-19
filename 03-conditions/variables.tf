variable ami_id {
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "environment" {
  default = "dev"
}

variable instance_type {
  type = string
  default = "t2.micro"
}

variable ec2_tags {
  type = map # map(string)
  default = {
    Name = "HelloWorld"
  }
}

variable sg_name {
  type = string
  default = "allow_all"
}

variable sg_description {
  type = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable from_port {
  type = string
  default = 0
}

variable to_port {
  type = string
  default = 0
}

variable protocol {
  type = string
  default = "-1"
}

variable cidr_blocks {
  type = list # list(string)
  default = ["0.0.0.0/0"]
}

variable ipv6_cidr_blocks {
  type = list # list(string)
  default = ["::/0"]
}

variable sg_tags {
  type = map # map(string)
  default = {
    Name = "allow_tls"
  }
}