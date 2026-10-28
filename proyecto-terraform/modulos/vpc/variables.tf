# Valores que el módulo raíz le pasa a este módulo

variable "proyecto" {
  description = "Nombre del proyecto"
  type        = string
}

variable "sufijo" {
  description = "Texto aleatorio de 6 caracteres"
  type        = string
}

variable "vpc_cidr" {
  description = "Rango de IPs de la VPC"
  type        = string
}

variable "subredes_cidr" {
  description = "Lista con los rangos de las subredes"
  type        = list(string)
}
