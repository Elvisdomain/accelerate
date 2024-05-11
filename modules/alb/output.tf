# output "alb" {
#   value = aws_lb.this
# }

output "alb_listener" {
  value = aws_lb_listener.wallet-listener-http.arn
}

output "alb_listener_blue_listener" {
  value = aws_lb_listener.wallet-listener-https.arn
}

output "tg_green" {
  value = aws_lb_target_group.wallet-TG
}
output "tg_blue" {
  value = aws_lb_target_group.wallet-TG
}
