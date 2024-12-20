############ PosgreSQL RDS Variables ############
variable "rds_allocated_storage" {
  type        = number
  description = "allocated RDS storage capacity"
  default     = 500
}
variable "rds_max_allocated_storage" {
  type        = number
  description = "max auto-scaling storage"
  default     = 1000
}
variable "rds_storage_type" {
  type        = string
  description = "RDS storage type"
  default     = "gp3"
}
variable "rds_iops" {
  type        = number
  description = "max iops for rds db"
  default     = 12000
}
variable "rds_db_name" {
  type        = string
  description = "RDS name"
  default     = "h_odoo"
}
variable "rds_identifier" {
  type        = string
  description = "RDS identifier"
  default     = "h_odoo"
}
variable "rds_engine" {
  type        = string
  description = "RDS db engine"
  default     = "postgres"
}
variable "rds_engine_version" {
  type        = string
  description = "RDS db engine version"
  default     = "12.20"
}
variable "rds_instance_class" {
  type        = string
  description = "RDS db instance class"
  default     = "db.m6g.2xlarge"
}
variable "rds_username" {
  type        = string
  description = "Username for RDS DB"
  default     = "odoo"
}
variable "rds_password" {
  type        = string
  description = "Password for RDS DB"
}
variable "rds_backup_retention_period" {
  type        = number
  description = "days to retain backup"
  default     = 7
}
variable "rds_allow_major_version_upgrade" {
  type        = bool
  description = "allow major version upgrade"
  default     = false
}
variable "rds_skip_final_snapshot" {
  type        = bool
  description = "skip final snapshot"
  default     = false
}
variable "rds_multi_az" {
  type        = bool
  description = "enable high availability for h_odoo db"
  default     = false
}
variable "rds_performance_insights_enabled" {
  type        = bool
  description = "Enable performance insights"
  default     = true
}
variable "rds_performance_insights_retention_period" {
  type        = number
  description = "Retain performance insights for 7 days"
  default     = 7
}
variable "rds_tag" {
  type        = map(string)
  description = "tags for RDS"
}
############ PosgreSQL RDS Subnet Group Resources ############
variable "rds_subnet_group_name" {
  type        = string
  description = "The name of the RDS subnet group"
}
variable "rds_subnet_ids" {
  type        = list(string)
  description = "list of subnet IDs for the RDS subnet group"
}
variable "rds_subnet_group_tags" {
  type        = map(string)
  description = "tags for the RDS subnet group"
}
############ PosgreSQL RDS SG Variables ############
variable "rds_sg_name" {
  type        = string
  description = "Name for RDS security group"
  default     = "rds_sg"
}
variable "rds_sg_description" {
  type        = string
  description = "description to RDS security group"
}
variable "rds_vpc_id" {
  type        = string
  description = "vpc id for security group"
}
variable "rds_sg_tags" {
  type        = map(string)
  description = "tags for security group"
}
variable "rds_sg_ingress_rules" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  }))
}
variable "rds_sg_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
############ PosgreSQL RDS Secret passowrd Variables ############
# variable "rds_secret_name" {
#   type        = string
#   description = "name of RDS secret"
# }
# variable "recovery_window_in_days" {
#   type        = number
#   description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
# }
# variable "rds_secret_description" {
#   type        = string
#   description = "description for RDS secret"
# }
# variable "rds_secret_credentials" {
#   type        = map(string)
#   description = "RDS secret credentials"
# }