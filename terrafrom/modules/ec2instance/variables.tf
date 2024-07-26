// Copyright (C) 2022 by Klimenko Maxim Sergeevich

variable "ec2_volume_size" {
  default = 30
}

variable "vpc_id_main" {
  default = "vpc-096e5bbc5fbfa0ebc"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "encryption_state" {
  default = true
}

variable "deploy_nixos" {
  default = false
}

variable "deploy_arch" {
  default = false
}

variable "deploy_ubuntu" {
  default = true
}

variable "aws_arch_ami" {
  default = "ami-0f670c4daa876739f"
}

variable "instance_tag_name" {
  default = "Web server"
}

variable "cidr_allowed_for_ssh" {
  default = ["0.0.0.0/0"]
}

variable "server_record_name" {
  default = "default"
}

variable "web_server_ingress" {
  default = false
}