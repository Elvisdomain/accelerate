# output "alb" {
#   value = aws_lb.this
# }

output "alb_listener_green" {
  value = aws_lb_listener.wallet-listener
}

output "alb_listener_blue" {
  value = aws_lb_listener.wallet-listener
}

output "alb_listener_https" {
  value = aws_lb_listener.https
}
output "alb_listener_green_listener" {
  value = aws_lb_listener.wallet-listener.arn
}

output "alb_listener_blue_listener" {
  value = aws_lb_listener.wallet-listener.arn
}

output "tg_green" {
  value = aws_lb_target_group.wallet-TG
}
output "tg_blue" {
  value = aws_lb_target_group.wallet-TG
}
