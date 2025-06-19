variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "version" {
    default = "1.0"
}

variable "component" {
    default = "cart"
}

variable "common_tags"{
    default = {
        Project = "roboshop"
        Terraform = "true"
    }
}

/* variable "final-name" {
    default = "${var.project}-${var.environment}-${var.component}"
} */

# ec2 name = cart
# ec2 name = roboshop-dev-cart


variable ami_id {
  type = string
  default = "ami-09c813fb71547fc4f"
}


variable instances {
  type = list
  default = ["mongodb", "redis", "mysql", "rabbitmq", "frontend"]
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

variable "zone_id" {
  default = "Z06794012YZ552T1IPKZA"
}

variable "domain_name" {
  default = "daws2025.online"
}