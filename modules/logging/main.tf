resource "aws_cloudwatch_log_group" "eks" {
  name              = "/eks/${var.name}"
  retention_in_days = 30
}
