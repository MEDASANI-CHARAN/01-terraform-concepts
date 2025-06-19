locals {
  final_name = "${var.project}-${var.environment}-${var.component}"
  instance_type = var.environment == "dev" ? "t2.micro" : "t2.small"
  ec2_tags = merge(
    var.common_tags,
    {
        environment = var.environment,
        version = var.version
    }
  )
}