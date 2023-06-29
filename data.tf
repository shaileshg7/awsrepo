data "aws_kms_key" "aws_rds_key" {
  key_id = "alias/aws/rds"
}
