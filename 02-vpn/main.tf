module "vpn_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  #this is optional, if we dont give this will be provisioned inside default subnet of default vpc
  # ssubnet_id = local.public_subnet_ids[0] # public subnet of default VPC
  tags = merge(
    {
        Name = "${var.project_name}-${var.env}-vpn"
    },
    var.common_tags
  )
}

# # moved to 01.1-firewalls#
# module "vpn_sg" {
#   source = "../../terraform-aws-securitygroup"
#   project_name = var.project_name 
#   sg_name = "roboshop-vpn"
#   sg_description = "allowing all ports from my home IP"
# #   sg_ingress_rules = var.sg_ingress_rules
#   vpc_id = data.aws_vpc.default.id  #we are capturing the local ID in locals.tf so we are using it
#   common_tags = var.common_tags
# }
