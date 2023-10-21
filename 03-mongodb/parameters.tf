resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.env}/mongodb_url"
  type  = "String"
  # for dev it is mongodb-dev.kpdigital.online
  # for prod it is mongodb-prod.kpdigital.online
  value = "${var.mongodb_record_name}-${var.env}.${var.zone_name}"
}