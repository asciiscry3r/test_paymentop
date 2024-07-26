// Copyright (C) 2022 by Klimenko Maxim Sergeevich

locals {
  aws_arch_ami = "ami-0e872aee57663ae2d"
}

module "deploy_ubuntu_server" {
    source = "./modules/ec2instance"

    instance_tag_name = "test-task"
    deploy_nixos = false
    deploy_ubuntu = true
    deploy_arch = false
    aws_arch_ami = local.aws_arch_ami
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = [ "0.0.0.0/0" ]
    server_record_name = "test.mksscryertower.quest"
    web_server_ingress = true
}
