
locals {
  aws_arch_ami = "ami-0d6f36690fea7a72f"

  // ami-00ac48b566b3a70d1
  // ami-0f670c4daa876739f
}

module "deploy_uni_server" {
    source = "./modules/ec2instance"

    instance_tag_name = "uni_server"
    deploy_nixos = false
    deploy_ubuntu = false
    deploy_arch = true
    aws_arch_ami = local.aws_arch_ami
    encryption_state = true
    instance_type = "t2.medium"
    vpc_id_main = "vpc-0b44d1c654ca78eb8"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = [ var.cidr_allowed_for_ssh ]
    server_record_name = "mksscryertower.quest"
    web_server_ingress = true
}
