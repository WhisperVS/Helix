############ PosgreSQL RDS Resources ############
resource "aws_db_instance" "odoo_db" {
  allocated_storage                     = var.rds_allocated_storage                     # 500 GB for production
  max_allocated_storage                 = var.rds_max_allocated_storage                 # Enable storage auto-scaling
  storage_type                          = var.rds_storage_type                          # gp3 for cost-effective performance
  iops                                  = var.rds_iops                                  # "12000" Provisioned IOPS for predictable performance
  db_name                               = var.rds_db_name                               # h_odoo
  identifier                            = var.rds_identifier                            # h_odoo
  engine                                = var.rds_engine                                # postgres
  engine_version                        = var.rds_engine_version                        # "12.20" Use the latest stable PostgreSQL 12 version
  instance_class                        = var.rds_instance_class                        # "db.m6g.2xlarge" Memory-optimized instance
  username                              = var.rds_username                              # odoo
  password                              = var.rds_password                              # Strong password
  backup_retention_period               = var.rds_backup_retention_period               # 7 days
  allow_major_version_upgrade           = var.rds_allow_major_version_upgrade           # false Prevent unintended major version upgrades
  db_subnet_group_name                  = aws_db_subnet_group.odoo_db_subnet_group.name #
  vpc_security_group_ids                = [aws_security_group.odoo_rds_sg.id]           #
  skip_final_snapshot                   = var.rds_skip_final_snapshot                   # false Ensure a final snapshot is created before deletion
  multi_az                              = var.rds_multi_az                              # true Enable high availability
  performance_insights_enabled          = var.rds_performance_insights_enabled          # true Enable performance insights
  performance_insights_retention_period = var.rds_performance_insights_retention_period # Retain performance insights for 7 days
  tags                                  = var.rds_tag
}

############ PosgreSQL RDS Subnet Group Resources ############
resource "aws_db_subnet_group" "odoo_db_subnet_group" {
  name       = var.rds_subnet_group_name
  subnet_ids = var.rds_subnet_ids
  tags       = var.rds_subnet_group_tags
}

############ PosgreSQL RDS SG Resources ############
resource "aws_security_group" "odoo_rds_sg" {
  name        = var.rds_sg_name
  description = var.rds_sg_description
  vpc_id      = var.rds_vpc_id

  tags = var.rds_sg_tags

  dynamic "ingress" {
    for_each = var.rds_sg_ingress_rules

    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
    }
  }
  dynamic "egress" {
    for_each = var.rds_sg_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

############ PosgreSQL RDS Secret passowrd Resources ############
# resource "aws_secretsmanager_secret" "versus_rds_secret" {
#   name                    = var.rds_secret_name
#   recovery_window_in_days = var.recovery_window_in_days
#   description             = var.rds_secret_description
# }

# resource "aws_secretsmanager_secret_version" "versus_rds_secret_version" {
#   secret_id     = aws_secretsmanager_secret.versus_rds_secret.id
#   secret_string = jsonencode(var.rds_secret_credentials)
# }
