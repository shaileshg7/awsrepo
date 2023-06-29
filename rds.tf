resource "aws_db_instance" "mydb" {
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  allocated_storage    = var.db_allocated_storage
  db_name              = var.db_name
  username             = var.db_username
  apply_immediately    = true
  #password             = random_password.rds_password.result

  manage_master_user_password   = true
  #master_user_secret_kms_key_id = aws_kms_key.master_user_secret_kms.key_id

  identifier           = var.rds_name

  skip_final_snapshot       = true
  final_snapshot_identifier = "${var.rds_name}-final-snapshot-${md5(timestamp())}"

  backup_retention_period = var.db_backup_retention_period
  maintenance_window      = var.db_maintenance_window
  vpc_security_group_ids  = var.db_security_groups
  db_subnet_group_name    = aws_db_subnet_group.mydb-subnet-group.name
  storage_encrypted       = var.storage_encrypted
  storage_type            = var.storage_type
  kms_key_id              = data.aws_kms_key.aws_rds_key.arn

}

resource "aws_db_subnet_group" "mydb-subnet-group" {
  name        = "mydb-subnet-group"
  description = "My DB Subnet Group"
  subnet_ids  = ["subnet-01edf870abf9e215d", "subnet-01ac1520566d9d177", "subnet-0bf2557b5dfc78bd5"]
}

resource "random_password" "rds_password" {
  length = var.random_password_length
  special = true
}
/*
resource "aws_kms_key" "master_user_secret_kms" {
  description = "Master User Credential"
}

resource "aws_kms_alias" "master_user_secret_kms_alias" {
  name          = "alias/master-user-key-alias"
  target_key_id = aws_kms_key.master_user_secret_kms.key_id
}
*/