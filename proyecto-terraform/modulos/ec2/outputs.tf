output "instance_id" {
  description = "ID del servidor (lo usa el NLB)"
  value       = aws_instance.servidor.id
}

output "ip_privada" {
  description = "IP privada del servidor"
  value       = aws_instance.servidor.private_ip
}
