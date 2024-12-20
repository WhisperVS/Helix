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

module "odoo_rds" {
  source = "../modules/postgresql_rds"

  ############ PosgreSQL RDS Root Variables ############
  rds_allocated_storage                     = var.root_rds_allocated_storage
  rds_max_allocated_storage                 = var.root_rds_allocated_storage
  rds_storage_type                          = var.root_rds_storage_type
  rds_iops                                  = var.root_rds_iops
  rds_db_name                               = var.root_rds_db_name
  rds_identifier                            = var.root_rds_identifier
  rds_engine                                = var.root_rds_engine
  rds_engine_version                        = var.root_rds_engine_version
  rds_instance_class                        = var.root_rds_instance_class
  rds_username                              = var.root_rds_username
  rds_password                              = var.root_rds_password
  rds_backup_retention_period               = var.root_rds_backup_retention_period
  rds_allow_major_version_upgrade           = var.root_rds_allow_major_version_upgrade
  rds_skip_final_snapshot                   = var.root_rds_skip_final_snapshot
  rds_multi_az                              = var.root_rds_multi_az
  rds_performance_insights_enabled          = var.root_rds_performance_insights_enabled
  rds_performance_insights_retention_period = var.root_rds_performance_insights_retention_period
  rds_tag                                   = var.root_rds_tag

  ############ PosgreSQL RDS Subnet Group Root Variables ############
  rds_subnet_group_name = var.root_rds_subnet_group_name
  rds_subnet_ids        = var.root_rds_subnet_ids
  rds_subnet_group_tags = var.root_rds_subnet_group_tags

  ############ PosgreSQL RDS SG Root Variables ############
  rds_sg_name          = var.root_rds_sg_name
  rds_sg_description   = var.root_rds_sg_description
  rds_vpc_id           = var.root_rds_vpc_id
  rds_sg_tags          = var.root_rds_sg_tags
  rds_sg_ingress_rules = var.root_rds_sg_ingress_rules
  rds_sg_egress_rules  = var.root_rds_sg_egress_rules
}
