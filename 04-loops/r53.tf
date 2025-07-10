# resource "aws_route53_record" "record" {
#     # count = 5
#   count = length(var.instances)
#   zone_id = var.zone_id
#   name    = "${var.instances[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = "1"
# allow_overwrite = true
# #   records = [aws_instance.roboshop[count.index].private_ip, aws_instance.roboshop[count.index].public_ip]
#   records = [var.instances[count.index] == "frontend" ? aws_instance.roboshop[count.index].public_ip : aws_instance.roboshop[count.index].private_ip]
# }