# Valores que este módulo "devuelve" para que otros módulos los usen

output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.principal.id
}

output "subnet_ids" {
  description = "Lista con los IDs de las subredes"
  value       = aws_subnet.subredes[*].id
}
