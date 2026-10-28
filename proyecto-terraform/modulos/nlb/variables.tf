variable "proyecto" {
  description = "Nombre del proyecto"
  type        = string
}

variable "sufijo" {
  description = "Texto aleatorio de 6 caracteres"
  type        = string
}

variable "numero" {
  description = "Número del balanceador (1, 2...)"
  type        = number
}

variable "vpc_id" {
  description = "ID de la VPC (viene del módulo vpc)"
  type        = string
}

variable "subnet_ids" {
  description = "Subredes donde vive el balanceador (vienen del módulo vpc)"
  type        = list(string)
}

variable "instance_id" {
  description = "Servidor al que le manda el tráfico (viene del módulo ec2)"
  type        = string
}

variable "puerto" {
  description = "Puerto que escucha el balanceador"
  type        = number
  default     = 80
}
