
locals {
  aws_arch_ami = id of amazon machine image

  // ami-00ac48b566b3a70d1
  // ami-0f670c4daa876739f
}

module "deploy_uni_server" {
    source = "./modules/ec2instance" = path to source of terraform module

    instance_tag_name = "uni_server" = name of tag for instance
    deploy_nixos = false = logic for choosing linux distro from my terraform module https://github.com/asciiscry3r/myinfrastructure.git
    deploy_ubuntu = false = same
    deploy_arch = true = same
    aws_arch_ami = local.aws_arch_ami = id of amazon machine image
    encryption_state = true = set or disable encription for storage
    instance_type = "t2.medium" = type of virtual instance for choosing ammount of compute resources
    vpc_id_main = "vpc-0b44d1c654ca78eb8" = id of private virtual network on AWS
    ec2_volume_size = "30" = size of storage in Gb
    cidr_allowed_for_ssh = [ var.cidr_allowed_for_ssh ] = pull of adresses allowed for ssh access in format 0.0.0.0/0
    server_record_name = "mksscryertower.quest" = DNS name
    web_server_ingress = true = set to allow or deny http and https traffic in security group
}
