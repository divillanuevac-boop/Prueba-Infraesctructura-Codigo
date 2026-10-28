variable "proyecto" {
  description = "Nombre del proyecto"
  type        = string
}

variable "sufijo" {
  description = "Texto aleatorio de 6 caracteres"
  type        = string
}

variable "nombre_bucket" {
  description = "Nombre corto del bucket (ej: datos, logs)"
  type        = string
}
