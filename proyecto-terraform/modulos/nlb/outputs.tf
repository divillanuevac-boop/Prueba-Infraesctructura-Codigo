output "nlb_dns" {
  description = "Dirección DNS del balanceador"
  value       = aws_lb.balanceador.dns_name
}

output "nlb_arn" {
  description = "ARN del balanceador"
  value       = aws_lb.balanceador.arn
}
