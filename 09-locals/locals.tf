locals {
  final_name = "${var.project}-${var.environment}-${var.component}" # roboshop-dev-cart
  instance_type = var.environment == "dev" ? "t2.micro" : "t2.small"
  sg_id = [aws_security_group.allow_everything.id]
  # ec2_tags = merge(
  #   var.common_tags,
  #   {
  #       environment = var.environment,
  #       version = var.app_version
  #   }
  # )

  ec2_tags = {
    for name in var.instances : name => merge(
      var.common_tags,
      var.ec2_tags,
      {
        Name      = name
        Component = name
      }
    )
  }
}