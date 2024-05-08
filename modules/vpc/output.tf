output "vpc_id" {
  value = aws_vpc.accelerate_vpc.id
}

output "subnets_private_id" {
  value = aws_subnet.accelerate-private.*.id
}
output "subnets_private_arn" {
  value = aws_subnet.accelerate-private.*.arn
}
output "subnets_public_id" {
  value = aws_subnet.accelerate-public.*.id
}
output "subnets_public_arn" {
  value = aws_subnet.accelerate-public.*.arn
}

# output "alb_sg_id" {
#   value = aws_security_group.alb.id
# }
# output "alb_sg_arn" {
#   value = aws_security_group.alb.arn
# }
output "this_sg_id" {
  value = aws_security_group.alb.id
}
output "this_sg_arn" {
  value = aws_security_group.alb.arn
}
