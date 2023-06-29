variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "db_username" {
  default = "postgres"
}

variable "db_password" {
  default = "password"
}

variable "db_name" {
  default = "mydatabase"
}

variable "rds_name" {
  default = "myrds"
}

variable "identifier_prefix" {
  default = "cc"
}

variable "db_instance_class" {
  default = "db.t3.small"
}

variable "db_engine" {
  default = "postgres"
}

variable "db_engine_version" {
  default = "15.2"
}

variable "db_allocated_storage" {
  default = 20
}

variable "db_backup_retention_period" {
  default = 0
}

variable "db_maintenance_window" {
  default = ""
}

variable "db_security_groups" {
  default = ["sg-07c1c389a8a9211a3"]
}

variable "db_subnet_group_name" {
  default = "mydb-subnet-group"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "storage_type" {
  description = "Specifies storage type"
  type        = string
  default     = "gp3"
}

variable "random_password_length" {
  description = "Length of the random password to create"
  type = number
  default = 8
}