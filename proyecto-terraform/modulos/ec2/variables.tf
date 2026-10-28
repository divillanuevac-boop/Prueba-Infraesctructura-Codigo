variable "proyecto" {
  description = "Nombre del proyecto"
  type        = string
}

variable "sufijo" {
  description = "Texto aleatorio de 6 caracteres"
  type        = string
}

variable "numero" {
  description = "Número del servidor (1, 2...) para ponerle nombre"
  type        = number
}

variable "subnet_id" {
  description = "Subred donde se crea el servidor (viene del módulo vpc)"
  type        = string
}

variable "tipo_instancia" {
  description = "Tamaño del servidor"
  type        = string
  default     = "t2.micro"
}
