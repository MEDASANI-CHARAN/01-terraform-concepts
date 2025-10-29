variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# variable "ec2_tags" {
#   type =  map(string) # map(any)
#   default = {
#     Name = "HelloWorld"
#   }
# }

variable "ec2_tags" {
  type    = string
  default = "HelloWorld"
}

variable "sg_name" {
  type    = string
  default = "allow_all"
}

variable "sg_description" {
  type    = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "from_port" {
  type    = string
  default = 0
}

variable "to_port" {
  type    = string
  default = 0
}

variable "protocol" {
  type    = string
  default = "-1"
}

variable "cidr_blocks" {
  type    = list(any) # list(string)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  type    = list(any) # list(string)
  default = ["::/0"]
}

variable "sg_tags" {
  type = map(any) # map(string)
  default = {
    Name = "allow_tls"
  }
}

variable "common_tags" {
  default = {
    Project   = "roboshop"
    Terraform = "true"
  }
}

variable "ingress_ports" {
  # type = list(map)
  default = [
    {
      from_port        = "22"
      to_port          = "22"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    },
    {
      from_port        = "80"
      to_port          = "80"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    },
    {
      from_port        = "8080"
      to_port          = "8080"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}

variable "egress_ports" {
  # type = list(map)
  default = [
    {
      from_port        = "0"
      to_port          = "0"
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    },
  ]
}