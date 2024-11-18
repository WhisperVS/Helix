module "vpc" {
  source = "../modules/vpc"
  ##################### PROVIDER ##########################
  region = var.region
  ######################### VPC ###########################
  vpc_cidr_block = var.vpc_cidr_block
  vpc_tags       = var.vpc_tags

  ####################### SUBNETS #######################
  subnets     = var.subnets
  subnet_tags = var.subnet_tags

  ######################## ROUTE TABLE ####################
  rt_cidr_block = var.rt_cidr_block
  rt_tags       = var.rt_tags

  ############# ROUTE TABLE SUBNET ASSOCIATION ############
  subnets_to_associate = var.subnets_to_associate

  ################### INTERNET GATEWAY ####################
  ig_gw_tags = var.ig_gw_tags
}
