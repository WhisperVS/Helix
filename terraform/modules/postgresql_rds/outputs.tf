output "versus_rds_endpoint" {
  value = aws_db_instance.odoo_db.address
}

output "versus_db_instance_id" {
  value = aws_db_instance.odoo_db.id
}
